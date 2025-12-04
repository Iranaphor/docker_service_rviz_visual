#!/bin/bash
# ###########################################################################
# XPRA Startup Script for RViz2
#
# Initializes XPRA server with RViz2 as child process for browser-based
# visualization.
#
# @author      James R. Heselden (github: iranaphor)
# @maintainer  James R. Heselden (github: iranaphor)
# @datecreated 30th November 2025
# @credits     Code structure and implementation were developed by the
#              author with assistance from Anthropic's Claude Sonnet 4.5
#              model via GitHub Copilot, used under the author's direction
#              and supervision.
#
###########################################################################

# Source ROS setup
source /opt/ros/humble/setup.bash

# Start XPRA with RViz as child process
# XPRA will exit when RViz exits (--exit-with-children)
exec xpra start :100 \
    --bind-tcp=0.0.0.0:14500 \
    --html=on \
    --start-child="ros2 run rviz2 rviz2" \
    --exit-with-children \
    --daemon=no \
    --pulseaudio=no \
    --notifications=no \
    --bell=no \
    --mdns=no
