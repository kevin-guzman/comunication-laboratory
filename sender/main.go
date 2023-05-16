package main

import (
	"machine"
	"time"
)

const (
	SYNC      = 0xA0
	MESSAGE_1 = 1
	MESSAGE_2 = 2
)

func main() {
	serialConfig := machine.UARTConfig{
		BaudRate: 9600,
	}
	serial := machine.UART2
	serial.Configure(serialConfig)

	led := machine.Pin(2)
	led.Configure(machine.PinConfig{Mode: machine.PinOutput})
	for {
		led.Low()
		delay(time.Millisecond * 1000)

		led.High()
		delay(time.Millisecond * 1000)

		serial.WriteByte(SYNC)
	}
}

func delay(duration time.Duration) {
	time.Sleep(duration)
}
