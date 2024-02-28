# libcommbase

libcommbase is a collection of libraries to centralize common functions that can be shared across multiple conversational AI assistant projects. It operates offline and can be implemented with AI (ML/DS) and programming languages.

<img alt="libcommbase" src="libcommbase.jpg?raw=true" width="512" height="512" />

## controller

libcommbase comes with 24 reliable and mutually exclusive control messages that can be recorded and sent forward together with the parsed messages and be used by skill applications to parameterize any skill option or be bypassed for message management/handling in any application subsequently. These control messages can also be changed or customized in its respective patterns file, and ultimately, increase or decrease in number preferably during your app designing phase. These out-of-the-box controls are:

* stop_previous_command
* reproduce_previuos_discourse
* rerun_previous_command
* start_five_mins_question_reminder_countdown
* start_ten_mins_question_reminder_countdown
* start_twenty_mins_question_reminder_countdown
* start_thirty_mins_question_reminder_countdown
* remind_a_queued_question_put_on_hold
* accept_changes
* deny_changes
* confirm_a_confirmation_request
* select_option_number_one
* select_option_number_two
* select_option_number_three
* select_option_number_four
* request_the_current_mode
* enter_the_normal_mode
* enter_the_conversation_mode
* enter_the_follow_mode
* enter_the_car_mode
* enter_the_boat_mode
* enter_the_plane_mode
* enter_the_starship_mode
* enter_the_refrigerator_mode

## Examples

Detailed information about examples can be found in the corresponding [`examples`](./examples) directory.

## Contributors

Thanks to the following people who have contributed to this project:

* [@estebanways](https://github.com/estebanways)

## Contact

If you want to contact us you can reach us at <stv.herrera@gmail.com>.

## License

This project uses the following license: [`License`](./COPYING).
