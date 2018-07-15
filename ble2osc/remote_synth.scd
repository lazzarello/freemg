// Set the default server to a remote instance running on the RPi
Server.default=s=Server.remote(~bleh, NetAddr("bleh.noise", 12001));
s.serverRunning;
s.quit;
{SinOsc.ar(660,0,0.2)}.play;
s.sendMsg("/n_free", 1000);

(
SynthDef("sine", { arg freq=800;
    var osc;
    osc = SinOsc.ar(freq, 0, 0.1); // 800 Hz sine oscillator
    Out.ar(0, osc); // send output to audio bus zero.
}).add; // write the def to disk in the default directory synthdefs/
)
a = Synth.new(\sine);
a.free;

// raw OSC messages
r.sendMsg("/s_new", "sine", x = r.nextNodeID, 1, 0);
r.sendMsg("/s_new", "sine", y = r.nextNodeID, 1, 0, "freq", 900);
r.sendMsg("/n_set", x, "freq", 600);
r.sendMsg("/n_set", x, "freq", 800);
r.sendMsg("/n_free", x);
r.sendMsg("/n_free", y);

(
r.sendBundle(0.2,
    ["/s_new", "sine", x = r.nextNodeID, 1, 0, "freq", 800],
    ["/s_new", "sine", y = r.nextNodeID, 1, 0, "freq", 1001],
    ["/s_new", "sine", z = r.nextNodeID, 1, 0, "freq", 1202]);
r.sendBundle(1.2, ["/n_free", x],["/n_free", y],["/n_free", z]);
)

// How do I get the remote server to run as "Group 1"?
// Using Synth class
a = Synth.head(Group(0), \sine, [\freq, 880]);
a.free;
r.queryAllNodes;