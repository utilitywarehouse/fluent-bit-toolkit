# fluent-bit-toolkit

[![Build Status](https://drone.prod.merit.uw.systems/api/badges/utilitywarehouse/fluent-bit-toolkit/status.svg)](https://drone.prod.merit.uw.systems/utilitywarehouse/fluent-bit-toolkit)

Docker image with a couple utilities to allow throttling logs by namespace in
fluent-bit, circumventing lack of dynamic filters.

Fluent-bit main config file should be aware of the generated filters and adapt
accordingly to make it work.
