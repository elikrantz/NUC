/*
This program maps the input of the joy_node to to run the ros2_controls_demos/example_2
*/

#include <chrono>
#include <functional>
#include <memory>
#include <string>


// following headers can be used depending on the input and output messag type
#include "rclcpp/rclcpp.hpp"
#include <sensor_msgs/msg/joy.hpp>             // message type used by the joy_node
// #include <ros_phoenix/msg/motor_control.hpp>   // message type used by the joy_node
#include <geometry_msgs/msg/twist_stamped.hpp> // message type diffbot uses
#include <geometry_msgs/msg/twist.hpp>
using std::placeholders::_1;
using namespace std::chrono_literals;

// axes and buttons of 8PowerA Nintendo Switch gamepad

enum Axis
{
  LEFT_STICK_X = 0,
  LEFT_STICK_Y = 1,
  RIGHT_STICK_X = 2,
  RIGHT_STICK_Y = 3,
  D_PAD_Y = 4,
  D_PAD_X = 5
};
enum Button
{
  Y = 0,
  B = 1,
  A = 2,
  X = 3,
  L = 4,
  R = 5,
  ZL = 6,
  ZR = 7,
  MINUS = 8,
  PLUS = 9,
  LEFT_STICK_BTN = 10,
  RIGHT_STICK_BTN = 11,
  HOME = 12,
  CIRCLE = 13

};


// Create the node class named Joy2Cmd which inherits the attributes
// and methods of the rclcpp::Node class.
class Joy2Cmd : public rclcpp::Node
{
public:
  // Constructor creates a node named joy2cmd.
  Joy2Cmd()
      : Node("joy2cmd")
  {

    // Create the subscription.
    // The topic_callback function executes whenever data is published
    // to the 'joy' topic.
    subscription_ = this->create_subscription<sensor_msgs::msg::Joy>(
        "joy", 10, std::bind(&Joy2Cmd::topic_callback, this, _1));

    // The size of the queue is 10 messages. 10 commands per second
    // diff_cmd = this->create_publisher<ros_phoenix::msg::MotorControl>("/talon_right/set", 10); // 3
    diff_cmd = this->create_publisher<geometry_msgs::msg::Twist>("/diffbot_base_controller/cmd_vel_unstamped", 10); // 3

    // publisher_talon_left = this->create_publisher<ros_phoenix::msg::MotorControl>("/talon_left/set", 10); // 1
  }

private:
  // Receives the published joy input
  void topic_callback(const sensor_msgs::msg::Joy &msg) const
  {
    rclcpp::Clock::SharedPtr clock = std::make_shared<rclcpp::Clock>(RCL_ROS_TIME);

    // Declare message in the publishing message type
    // auto message_talon_right = ros_phoenix::msg::MotorControl();
    // auto message_talon_left = ros_phoenix::msg::MotorControl();
    auto cmd_ = geometry_msgs::msg::Twist();

    // setting the required to parameters for the message interface
    // message_talon_right.mode = 0; // 0: percentage output, 1: velocity
    // message_talon_left.mode = 0;

    // inputs are scales are [-1,1], output scale [-0.2,0.2]. Hence, input is divided by 5
    double fwd = msg.axes[LEFT_STICK_Y]; // feedback from the gamepad
    double turn = msg.axes[RIGHT_STICK_X];
    // setting the proper velocity
    // message_talon_right.value = fwd + turn;
    // message_talon_left.value = fwd - turn;

    //cmd_.header.frame_id = ' '; // for twiststamped messages the headers can be predefined
    cmd_.linear.x = fwd;
    cmd_.angular.z = turn;

    // Publish the message to diffbot
    diff_cmd->publish(cmd_);

  }

  // Declare the subscription attribute
  rclcpp::Subscription<sensor_msgs::msg::Joy>::SharedPtr subscription_;

  // Declaration of the publisher attribute for diffbot
  // rclcpp::Publisher<ros_phoenix::msg::MotorControl>::SharedPtr diff_cmd;
  rclcpp::Publisher<geometry_msgs::msg::Twist>::SharedPtr diff_cmd;

  // Declaration of the publisher attribute for rrbot
  // rclcpp::Publisher<ros_phoenix::msg::MotorControl>::SharedPtr publisher_talon_left;

  // std::string received = "";
  // int32_t timeout_ms_ = 1000;
  // sleep(5);
};

int main(int argc, char *argv[])
{
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<Joy2Cmd>());
  rclcpp::shutdown();
  return 0;
}
