// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`


`include "common_cells/assertions.svh"

module idma_reg64_2d_frontend_reg_top #(
    parameter type reg_req_t = logic,
    parameter type reg_rsp_t = logic,
    parameter int AW = 7
) (
  input clk_i,
  input rst_ni,
  input  reg_req_t reg_req_i,
  output reg_rsp_t reg_rsp_o,
  // To HW
  output idma_reg64_2d_frontend_reg_pkg::idma_reg64_2d_frontend_reg2hw_t reg2hw, // Write
  input  idma_reg64_2d_frontend_reg_pkg::idma_reg64_2d_frontend_hw2reg_t hw2reg, // Read


  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import idma_reg64_2d_frontend_reg_pkg::* ;

  localparam int DW = 64;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  // Below register interface can be changed
  reg_req_t  reg_intf_req;
  reg_rsp_t  reg_intf_rsp;


  assign reg_intf_req = reg_req_i;
  assign reg_rsp_o = reg_intf_rsp;


  assign reg_we = reg_intf_req.valid & reg_intf_req.write;
  assign reg_re = reg_intf_req.valid & ~reg_intf_req.write;
  assign reg_addr = reg_intf_req.addr;
  assign reg_wdata = reg_intf_req.wdata;
  assign reg_be = reg_intf_req.wstrb;
  assign reg_intf_rsp.rdata = reg_rdata;
  assign reg_intf_rsp.error = reg_error;
  assign reg_intf_rsp.ready = 1'b1;

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err;


  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic [63:0] src_addr_qs;
  logic [63:0] src_addr_wd;
  logic src_addr_we;
  logic [63:0] dst_addr_qs;
  logic [63:0] dst_addr_wd;
  logic dst_addr_we;
  logic [63:0] num_bytes_qs;
  logic [63:0] num_bytes_wd;
  logic num_bytes_we;
  logic conf_decouple_qs;
  logic conf_decouple_wd;
  logic conf_decouple_we;
  logic conf_deburst_qs;
  logic conf_deburst_wd;
  logic conf_deburst_we;
  logic conf_serialize_qs;
  logic conf_serialize_wd;
  logic conf_serialize_we;
  logic status_qs;
  logic status_re;
  logic [63:0] next_id_qs;
  logic next_id_re;
  logic [63:0] done_qs;
  logic done_re;
  logic [63:0] stride_src_qs;
  logic [63:0] stride_src_wd;
  logic stride_src_we;
  logic [63:0] stride_dst_qs;
  logic [63:0] stride_dst_wd;
  logic stride_dst_we;
  logic [63:0] num_repetitions_qs;
  logic [63:0] num_repetitions_wd;
  logic num_repetitions_we;

  // Register instances
  // R[src_addr]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_src_addr (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (src_addr_we),
    .wd     (src_addr_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.src_addr.q ),

    // to register interface (read)
    .qs     (src_addr_qs)
  );


  // R[dst_addr]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_dst_addr (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (dst_addr_we),
    .wd     (dst_addr_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.dst_addr.q ),

    // to register interface (read)
    .qs     (dst_addr_qs)
  );


  // R[num_bytes]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_num_bytes (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (num_bytes_we),
    .wd     (num_bytes_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.num_bytes.q ),

    // to register interface (read)
    .qs     (num_bytes_qs)
  );


  // R[conf]: V(False)

  //   F[decouple]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_conf_decouple (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (conf_decouple_we),
    .wd     (conf_decouple_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.conf.decouple.q ),

    // to register interface (read)
    .qs     (conf_decouple_qs)
  );


  //   F[deburst]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_conf_deburst (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (conf_deburst_we),
    .wd     (conf_deburst_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.conf.deburst.q ),

    // to register interface (read)
    .qs     (conf_deburst_qs)
  );


  //   F[serialize]: 2:2
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RW"),
    .RESVAL  (1'h0)
  ) u_conf_serialize (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (conf_serialize_we),
    .wd     (conf_serialize_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.conf.serialize.q ),

    // to register interface (read)
    .qs     (conf_serialize_qs)
  );


  // R[status]: V(True)

  prim_subreg_ext #(
    .DW    (1)
  ) u_status (
    .re     (status_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.status.d),
    .qre    (),
    .qe     (),
    .q      (),
    .qs     (status_qs)
  );


  // R[next_id]: V(True)

  prim_subreg_ext #(
    .DW    (64)
  ) u_next_id (
    .re     (next_id_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.next_id.d),
    .qre    (reg2hw.next_id.re),
    .qe     (),
    .q      (reg2hw.next_id.q ),
    .qs     (next_id_qs)
  );


  // R[done]: V(True)

  prim_subreg_ext #(
    .DW    (64)
  ) u_done (
    .re     (done_re),
    .we     (1'b0),
    .wd     ('0),
    .d      (hw2reg.done.d),
    .qre    (reg2hw.done.re),
    .qe     (),
    .q      (reg2hw.done.q ),
    .qs     (done_qs)
  );


  // R[stride_src]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_stride_src (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (stride_src_we),
    .wd     (stride_src_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.stride_src.q ),

    // to register interface (read)
    .qs     (stride_src_qs)
  );


  // R[stride_dst]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_stride_dst (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (stride_dst_we),
    .wd     (stride_dst_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.stride_dst.q ),

    // to register interface (read)
    .qs     (stride_dst_qs)
  );


  // R[num_repetitions]: V(False)

  prim_subreg #(
    .DW      (64),
    .SWACCESS("RW"),
    .RESVAL  (64'h0)
  ) u_num_repetitions (
    .clk_i   (clk_i    ),
    .rst_ni  (rst_ni  ),

    // from register interface
    .we     (num_repetitions_we),
    .wd     (num_repetitions_wd),

    // from internal hardware
    .de     (1'b0),
    .d      ('0  ),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.num_repetitions.q ),

    // to register interface (read)
    .qs     (num_repetitions_qs)
  );




  logic [9:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[0] = (reg_addr == IDMA_REG64_2D_FRONTEND_SRC_ADDR_OFFSET);
    addr_hit[1] = (reg_addr == IDMA_REG64_2D_FRONTEND_DST_ADDR_OFFSET);
    addr_hit[2] = (reg_addr == IDMA_REG64_2D_FRONTEND_NUM_BYTES_OFFSET);
    addr_hit[3] = (reg_addr == IDMA_REG64_2D_FRONTEND_CONF_OFFSET);
    addr_hit[4] = (reg_addr == IDMA_REG64_2D_FRONTEND_STATUS_OFFSET);
    addr_hit[5] = (reg_addr == IDMA_REG64_2D_FRONTEND_NEXT_ID_OFFSET);
    addr_hit[6] = (reg_addr == IDMA_REG64_2D_FRONTEND_DONE_OFFSET);
    addr_hit[7] = (reg_addr == IDMA_REG64_2D_FRONTEND_STRIDE_SRC_OFFSET);
    addr_hit[8] = (reg_addr == IDMA_REG64_2D_FRONTEND_STRIDE_DST_OFFSET);
    addr_hit[9] = (reg_addr == IDMA_REG64_2D_FRONTEND_NUM_REPETITIONS_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = (reg_we &
              ((addr_hit[0] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[0] & ~reg_be))) |
               (addr_hit[1] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[1] & ~reg_be))) |
               (addr_hit[2] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[2] & ~reg_be))) |
               (addr_hit[3] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[3] & ~reg_be))) |
               (addr_hit[4] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[4] & ~reg_be))) |
               (addr_hit[5] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[5] & ~reg_be))) |
               (addr_hit[6] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[6] & ~reg_be))) |
               (addr_hit[7] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[7] & ~reg_be))) |
               (addr_hit[8] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[8] & ~reg_be))) |
               (addr_hit[9] & (|(IDMA_REG64_2D_FRONTEND_PERMIT[9] & ~reg_be)))));
  end

  assign src_addr_we = addr_hit[0] & reg_we & !reg_error;
  assign src_addr_wd = reg_wdata[63:0];

  assign dst_addr_we = addr_hit[1] & reg_we & !reg_error;
  assign dst_addr_wd = reg_wdata[63:0];

  assign num_bytes_we = addr_hit[2] & reg_we & !reg_error;
  assign num_bytes_wd = reg_wdata[63:0];

  assign conf_decouple_we = addr_hit[3] & reg_we & !reg_error;
  assign conf_decouple_wd = reg_wdata[0];

  assign conf_deburst_we = addr_hit[3] & reg_we & !reg_error;
  assign conf_deburst_wd = reg_wdata[1];

  assign conf_serialize_we = addr_hit[3] & reg_we & !reg_error;
  assign conf_serialize_wd = reg_wdata[2];

  assign status_re = addr_hit[4] & reg_re & !reg_error;

  assign next_id_re = addr_hit[5] & reg_re & !reg_error;

  assign done_re = addr_hit[6] & reg_re & !reg_error;

  assign stride_src_we = addr_hit[7] & reg_we & !reg_error;
  assign stride_src_wd = reg_wdata[63:0];

  assign stride_dst_we = addr_hit[8] & reg_we & !reg_error;
  assign stride_dst_wd = reg_wdata[63:0];

  assign num_repetitions_we = addr_hit[9] & reg_we & !reg_error;
  assign num_repetitions_wd = reg_wdata[63:0];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[63:0] = src_addr_qs;
      end

      addr_hit[1]: begin
        reg_rdata_next[63:0] = dst_addr_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[63:0] = num_bytes_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[0] = conf_decouple_qs;
        reg_rdata_next[1] = conf_deburst_qs;
        reg_rdata_next[2] = conf_serialize_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[0] = status_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[63:0] = next_id_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[63:0] = done_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[63:0] = stride_src_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[63:0] = stride_dst_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[63:0] = num_repetitions_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Unused signal tieoff

  // wdata / byte enable are not always fully used
  // add a blanket unused statement to handle lint waivers
  logic unused_wdata;
  logic unused_be;
  assign unused_wdata = ^reg_wdata;
  assign unused_be = ^reg_be;

  // Assertions for Register Interface
  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

endmodule
