# blinkt-pi5

Patched [Blinkt!](https://shop.pimoroni.com/products/blinkt) Python library for **Raspberry Pi 5**.

The official `blinkt` library uses `RPi.GPIO`, which does not work on the Pi 5 (RP1 chip). This fork replaces it with `lgpio`.

## Changes from upstream

- Replaced `RPi.GPIO` with `lgpio` for GPIO access
- Fixed `gpio_write()` calls to pass strict `0`/`1` values (lgpio rejects truthy/falsy)
- Added GPIO pin claim error recovery (free + re-claim if already in use)
- Lazy GPIO initialization on first `show()` call
- Version set to `0.1.2-pi5`

## Requirements

- Raspberry Pi 5
- `lgpio` (pre-installed on Raspberry Pi OS Bookworm)
- Blinkt! hardware on GPIO header

## Install

```bash
sudo ./install.sh
```

This copies `blinkt.py` to `/usr/lib/python3/dist-packages/` (backing up the original).

## Usage

Same API as the original library — no code changes needed:

```python
import blinkt

blinkt.set_pixel(0, 255, 0, 0, 0.1)  # red
blinkt.show()
```

Requires `sudo` or root access for GPIO.
