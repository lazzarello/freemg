# Freemg

This project is a set of hardware information to build a electromyograph to sense muscle movelemt. It began as an art project with Ben Margolis, Jenny Torino, Dana Kotler and Lee Azzarello.

The DIY hardware project was built by Ben Margolis and [published online](http://www.torino-margolis.com/Torino_Margolis/FreEMG.html). This project takes the hand written notes and formalized them into a bill of materials and a PCB design.

## Development

Electronic phases of prototype design

1. Power. 2 9v batteries with +/- alternating connections as reference (0v)
1. Acquisition. The INA106 diff amp has a static gain control between pins 5 and 6. A 1m resistor controls our gain in this case. I guess this means "full gain without clipping". A 1m resister also covers the reference signal.
1. Amplification. First stage is an inverting amplifier with static gain, also controlled by two resistors, this time. The second stage is AC coupling and a high pass filter. THis uses a second opamp in the TL084. Two opamps down, two to go.
1. Rectification. We're only concerned with values above 0, so we need to take a wave and invert the troughs. This requires a diode loop, a third opamp and some resistors. There's a lot of feedback in this phase so the circuit is pretty complicated looking.
1. Filtering. The fourth opamp works as a low pass filter, with some resistors.
1. Amplification. The final circuit is a fifth opamp with a variable resistor. This is optional. Ben's design does not require a fifth opamp.

The circuit schema is done in [gEDA](https://en.wikipedia.org/wiki/GEDA#Detailed_Description)
The reciever will probably be a Raspberry-Pi 3, since I have some of them around and there is wifi built in.
The sound patches will probably be written in Pure Data, since I've [previously published something](https://github.com/lazzarello/puredata-emg-engine) along those lines.

### Future Goals

* Remove as many analog electronics as possible, replacing them with DSP hardware or even a general purpose computer.
* Write general purpose software which translate the EMG voltage into UDP packets over the OSC protocol.
* Integrate a synthesizer into a single unit with the EMG controller, and communicate to a loudspeaker system via a network protocol.

### References

http://www.advancertechnologies.com/  
http://www.instructables.com/id/Muscle-EMG-Sensor-for-a-Microcontroller/  
https://hackaday.io/project/4716-synthasense-suit-control-stuff-with-your-muscles/log/15992-a-lesson-in-semg-and-analog-physiological-sensing-electronics/discussion-34754  
http://www.xth.io/forging-a-new-medium-together-through-open-knowledge/
