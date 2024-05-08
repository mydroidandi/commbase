[![Python Package using Conda](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml/badge.svg)](https://github.com/mydroidandi/commbase/actions/workflows/python-package-conda.yml)
[![Python Version](https://img.shields.io/badge/Python-3.10%20%7C%203.11%20%7C%203.12-blue)](https://img.shields.io/badge/python-3.10%20%7C%203.11%20%7C%203.12-blue)

# libcommbase

<img alt="libcommbase" src="libcommbase.jpg?raw=true" width="512" height="512" />

libcommbase is a collection of libraries to centralize common functions that can be shared across multiple conversational AI Powered assistant projects. It operates offline and can be implemented with AI (ML/DS) and programming languages.

## controller

libcommbase comes with a number of possible reliable and mutually exclusive control messages that can be recorded and sent forward to get processed by skill applications. These control messages can also be changed or customized in its respective patterns file, and ultimately, increase or decrease in number preferably during your app designing phase. These out-of-the-box controls are:

### Cancel previous actions

* stop_previous_command

### Repetitions

* rerun_previous_command
* reproduce_previuos_discourse

### Start Reminder Countdowns

* start_five_mins_question_reminder_countdown
* start_ten_mins_question_reminder_countdown
* start_twenty_mins_question_reminder_countdown
* start_thirty_mins_question_reminder_countdown
* remind_a_queued_question_put_on_hold

### Decision-Making

* accept_changes
* deny_changes
* confirm_a_confirmation_request

### Select Options

* select_option_number_one
* select_option_number_two
* select_option_number_three
* select_option_number_four

### Use Modes

* request_the_current_mode
* enter_the_computer_mode
* enter_the_robot_mode
* enter_the_car_mode
* enter_the_boat_mode
* enter_the_plane_mode
* enter_the_starship_mode
* enter_the_iron_man_mode
* enter_the_refrigerator_mode

### Use Submodes

* enter_the_automatic_submode
* enter_the_automated_submode
* enter_the_autonomous_submode

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
