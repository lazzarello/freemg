(
SynthDef.new(\sawsynth, {|freq = 400, out|
	Out.ar(out,
		RLPF.ar(
			Saw.ar([100,250],0.1),
			freq,
			0.05)
	)
}).add;
)

(
a = Synth.new(\sawsynth);
OSCdef.new(\feather,{ |msg, time, addr, recvPort|
	a.set(\freq, msg[1].asInteger.linexp(0,245,400,8000));
	msg[1].postln;
}, '/feather/pot1', recvPort: 12000);
)
a.free;
OSCdef.freeAll;