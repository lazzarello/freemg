#!/bin/bash
/usr/bin/jack_connect SuperCollider:out_1 system:playback_1
/usr/bin/jack_connect SuperCollider:out_2 system:playback_2
/usr/bin/jack_connect SuperCollider:in_1 system:capture_1
/usr/bin/jack_connect SuperCollider:in_2 system:capture_2
