package main

import (
	"machine"
	"time"
)

func main() {
	serialConfig := machine.UARTConfig{
		BaudRate: 9600,
	}
	serial := machine.UART2
	serial.Configure(serialConfig)

	machine.UART0.Configure(machine.UARTConfig{
		BaudRate: 9600,
	})

	led := machine.Pin(2)
	led.Configure(machine.PinConfig{Mode: machine.PinOutput})
	for {
		led.Low()
		time.Sleep(time.Millisecond * 100)

		led.High()
		time.Sleep(time.Millisecond * 100)

		println("hola\n")
	}
}
