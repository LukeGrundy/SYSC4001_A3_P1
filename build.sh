if [ ! -d "bin" ]; then
    mkdir bin
else
	rm bin/*
fi

g++ -g -O0 -I . -o bin/interrupts_EP interrupts_EP_LukeGrundy_CameronGreer.cpp
g++ -g -O0 -I . -o bin/interrupts_RR interrupts_RR_LukeGrundy_CameronGreer.cpp
g++ -g -O0 -I . -o bin/interrupts_EP_RR interrupts_EP_RR_LukeGrundy_CameronGreer.cpp
