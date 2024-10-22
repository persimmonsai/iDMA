// Copyright 2022 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Thomas Benz <tbenz@ethz.ch>

// Guard macros for non-synthesizable code

`ifndef IDMA_GUARD_SVH_
`define IDMA_GUARD_SVH_

`define IDMA_NONSYNTH_BLOCK(__block) \
`ifndef TARGET_SYNTHESIS             \
`ifndef TARGET_VERILATOR             \
`ifndef TARGET_XSIM                  \
`ifndef TARGET_FORMALITY             \
`ifndef VERILATOR                    \
`ifndef SYNTHESIS                    \
`ifndef XSIM                         \
/* pragma translate_off */           \
__block                              \
/* pragma translate_on */            \
`endif                               \
`endif                               \
`endif                               \
`endif                               \
`endif                               \
`endif                               \
`endif

`endif
