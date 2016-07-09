# Freemg

This project is a set of hardware information to build a electromyograph to sense muscle movelemt. It began as an art project with Ben Margolis, Jenny Torino, Dana Kotler and Lee Azzarello.

The DIY hardware project was built by Ben Margolis and [published online](http://www.torino-margolis.com/Torino_Margolis/FreEMG.html). This project takes the hand written notes and formalized them into a bill of materials and a PCB design.

## Development

The circuit schema is done in [gEDA](https://en.wikipedia.org/wiki/GEDA#Detailed_Description)
The reciever will probably be a Raspberry-Pi 3, since I have some of them around and there is wifi built in.
The sound patches will probably be written in Pure Data, since I've [previously published something](https://github.com/lazzarello/puredata-emg-engine) along those lines.

### Future Goals

* Remove as many analog electronics as possible, replacing them with DSP hardware or even a general purpose computer.
* Write general purpose software which translate the EMG voltage into UDP packets over the OSC protocol.
* Integrate a synthesizer into a single unit with the EMG controller, and communicate to a loudspeaker system via a network protocol.

### References

http://www.instructables.com/id/Muscle-EMG-Sensor-for-a-Microcontroller/  
https://hackaday.io/project/4716-synthasense-suit-control-stuff-with-your-muscles/log/15992-a-lesson-in-semg-and-analog-physiological-sensing-electronics/discussion-34754
