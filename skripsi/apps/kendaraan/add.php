<div class="breadcrumb">
    <a href="<?php echo APPURL;?>/kendaraan/">Kendaraan</a> &nbsp;&raquo;&nbsp;
    Tambah Kendaraan
</div>

<h4 class="content-title">Form Tambah Data ATK</h4>

<form action='action.php' method='POST'>
    <div>
        <div class="block">
            <table cellpadding="7">
            <tr>
                <td><span class="asterisk">*</span>Jenis</td>
                <td>:</td>
                <td>
                    <select name="no_polisi">
                        <option value="">- Pilih Invetaris -</option>
                        <option value="komputer">Komputer</option>
                        <option value="laptop">Laptop</option>
                        <option value="printer">Printer</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="200"><span class="asterisk">*</span>Pengguna</td>
                <td width="1">:</td>
                <td>
                    <select name="penggunakendaraan">
                        <option value="">- Pilih Pengguna -</option>
                        <?php
                        $sql = "SELECT * FROM pengguna_kendaraan ORDER BY nama_pengguna ASC";
                        $query = query($sql);
                        while($data = mysqli_fetch_array($query)){
                            ?><option value="<?php echo $data['id_penggunakendaraan'];?>"><?php echo $data['nama_pengguna'];?></option><?php
                        }?>
                    </select>                
                </td>
            </tr>
            <tr>
                <td><span class="asterisk">*</span>Jabatan</td>
                <td>:</td>
                <td>
                    <select name="tahun_pembuatan">
                        <option value="">- Pilih Jabatan -</option>
                        <option value="ketua">KETUA</option>
                        <option value="wakil">WAKIL KETUA</option>
                        <option value="sekre">SEKRETARIS</option>
                        <option value="panitera">PANITERA</option>
                        <option value="pp">PANITERA PENGGANTI</option>
                        <option value="kesek">KASUBAG KESEKRETARIATAN</option>
                        <option value="kepa">KASUBAG KEPANITERAAN</option>
                        <option value="ptsp">PTSP</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><span class="asterisk">*</span>Ruangan</td>
                <td>:</td>
                <td><input type='text' name='nama_stnk' placeholder='nama_stnk'></td>
            </tr>
            <tr>
                <td><span class="asterisk">*</span>Merk</td>
                <td>:</td>
                <td><input type='text' name='merk' placeholder='merk'></td>
            </tr>
            <tr>
                <td><span class="asterisk">*</span>Jenis</td>
                <td>:</td>
                <td>
                    <select name="jenis">
                        <option value="">- Pilih Jenis -</option>
                        <option value="komputer">Komputer</option>
                        <option value="laptop">Laptop</option>
                        <option value="printer">Printer</option>
                    </select>
                </td>
            </tr>
             <!-- <tr>
                <td><span class="asterisk">*</span>Jabatan</td>
                <td>:</td>
                <td><input type='text' name='tahun_pembuatan' placeholder='tahun_pembuatan'></td>
            </tr> -->
            <!-- <tr>
                <td><span class="asterisk">*</span>No.Rangka</td>
                <td>:</td>
                <td><input type='text' name='no_rangka' placeholder='no_rangka'></td>
            </tr> -->
            <!-- <tr>
                <td><span class="asterisk">*</span>No.Mesin</td>
                <td>:</td>
                <td><input type='text' name='no_mesin' placeholder='no_mesin'></td>
            </tr> -->
            </table>
        </div>

        <div class="block">
            <table cellpadding="7">
            <!-- <tr>
                <td><span class="asterisk">*</span>Posisi STNK</td>
                <td>:</td>
                <td><input type='text' name='posisi_stnk' placeholder='posisi_stnk'></td>
            </tr> -->
            <tr valign="top">
                <td><span class="asterisk">*</span>Status</td>
                <td>:</td>
                <td>
                    <div style="margin-bottom:8px"><input type="radio" name="nama_bpkb" id="lunas" value="service"><label for="lunas">Service</label></div>
                    <div><input type="radio" name="nama_bpkb" id="kredit" value="Digunakan"><label for="Normal">Normal</label></div>
                </td>
            </tr>
            <!-- <tr>
                <td><span class="asterisk">*</span>Status Kondisis</td>
                <td>:</td>
                <td><input type='text' name='nama_bpkb' placeholder='NORMAL/SERVICE'></td>
            </tr> -->
            <!-- <tr>
                <td><span class="asterisk">*</span>Posisi BPKB</td>
                <td>:</td>
                <td><input type='text' name='posisi_bpkb' placeholder='posisi_bpkb'></td>
            </tr> -->
            <!-- <tr valign="top">
                <td><span class="asterisk">*</span>Status</td>
                <td>:</td>
                <td>
                    <div style="margin-bottom:8px"><input type="radio" name="status_kendaraan" id="lunas" value="Maintance"><label for="lunas">Maintance</label></div>
                    <div><input type="radio" name="status_kendaraan" id="kredit" value="Digunakan"><label for="kredit">Digunakan</label></div>
                </td>
            </tr> -->
            <!-- <tr>
                <td>Asuransi</td>
                <td>:</td>
                <td>
                    <select name="asuransi">
                        <option value="0">- Pilih Asuransi-</option>
                        <?php
                        $sql = "SELECT * FROM master_asuransi ORDER BY pengguna ASC";
                        $query = query($sql);
                        while($data = mysqli_fetch_array($query)){
                            ?><option value="<?php echo $data['id_master_asuransi'];?>"><?php echo $data['pengguna'];?></option><?php
                        }?>
                    </select>
                </td>
            </tr> -->
            </table>
        </div>
    </div>

    <div style="clear:both"></div>
    <br/>
    <div id="tab-container">
        <ul class="tab-nav">
            <!-- <li><a href="#tab-stnk" class="active">Informasi STNK</a></li> -->
            <!-- <li><a href="#tab-pajak">Informasi Pajak</a></li> -->
            <li><a href="#tab-service">Informasi Service</a></li>
            <!-- <li><a href="#tab-kir">Informasi KIR</a></li>             -->
            <!-- <li><a href="#tab-asuransi">Informasi Asuransi</a></li> -->
        </ul>

        <!-- <div id="target">
            <div id="tab-stnk" class="tab">
                <i class="note">Masukkan informasi mengenai pembayaran STNK kendaraan (*Jika ada).</i><br/><br/>
                <table cellpadding="7">
                    <tr>
                        <td width="230"><span class="asterisk">*</span>Tanggal Pembayaran STNK</td>
                        <td width="1">:</td>
                        <td><input type='text' name='info[stnk][tgl_pelaksanaan]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Berlaku Hingga</td>
                        <td>:</td>
                        <td><input type='text' name='info[stnk][tgl_berlaku]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Biaya</td>
                        <td>:</td>
                        <td>Rp <input type='text' name='info[stnk][biaya]' placeholder='' size="30"></td>
                    </tr>
                    <tr valign="top">
                        <td>Keterangan</td>
                        <td>:</td>
                        <td><textarea name="info[stnk][keterangan]" cols="50" rows="4" maxlength="255"></textarea></td>
                    </tr>
                </table>
            </div> -->

            <!-- <div id="tab-pajak" class="tab">
                <i class="note">Masukkan informasi mengenai pembayaran Pajak kendaraan (*Jika ada).</i><br/><br/>
                <table cellpadding="7">
                    <tr>
                        <td width="230"><span class="asterisk">*</span>Tanggal Pembayaran Pajak</td>
                        <td width="1">:</td>
                        <td><input type='text' name='info[pajak][tgl_pelaksanaan]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Berlaku Hingga</td>
                        <td>:</td>
                        <td><input type='text' name='info[pajak][tgl_berlaku]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Biaya</td>
                        <td>:</td>
                        <td>Rp <input type='text' name='info[pajak][biaya]' placeholder='' size="30"></td>
                    </tr>
                    <tr valign="top">
                        <td>Keterangan</td>
                        <td>:</td>
                        <td><textarea name="info[pajak][keterangan]" cols="50" rows="4" maxlength="255"></textarea></td>
                    </tr>
                </table>
            </div> -->

            <!-- <div id="tab-kir" class="tab">
                <i class="note">Masukkan informasi mengenai pembayaran KIR kendaraan (*Jika ada).</i><br/><br/>
                <table cellpadding="7">
                    <tr>
                        <td width="230"><span class="asterisk">*</span>Tanggal Pembayaran KIR</td>
                        <td width="1">:</td>
                        <td><input type='text' name='info[kir][tgl_pelaksanaan]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Berlaku Hingga</td>
                        <td>:</td>
                        <td><input type='text' name='info[kir][tgl_berlaku]' placeholder='' size="30" class="datepicker" readonly></td>
                    </tr>
                    <tr>
                        <td><span class="asterisk">*</span>Biaya</td>
                        <td>:</td>
                        <td>Rp <input type='text' name='info[kir][biaya]' placeholder='' size="30"></td>
                    </tr>
                    <tr valign="top">
                        <td>Keterangan</td>
                        <td>:</td>
                        <td><textarea name="info[kir][keterangan]" cols="50" rows="4" maxlength="255"></textarea></td>
                    </tr>
                </table>
            </div> -->

            <div id="tab-service" class="tab">
    <i class="note">Masukkan informasi mengenai pembayaran SERVICE kendaraan (*Jika ada).</i><br/><br/>
    <table cellpadding="7">
        <tr>
            <td width="230"><span class="asterisk">*</span>Tanggal Pembayaran service</td>
            <td width="1">:</td>
            <td><input type='text' name='info[service][tgl_pelaksanaan]' placeholder='' size="30" class="datepicker" readonly></td>
        </tr>
        <tr>
            <td><span class="asterisk">*</span>Berlaku Hingga</td>
            <td>:</td>
            <td><input type='text' name='info[service][tgl_berlaku]' placeholder='' size="30" class="datepicker" readonly></td>
        </tr>
        <tr>
            <td><span class="asterisk">*</span>Total</td>
            <td>:</td>
            <td>Rp <input type='text' name='info[service][biaya]' placeholder='' size="30"></td>
        </tr>
        <tr valign="top">
            <td>Keterangan</td>
            <td>:</td>
            <td><textarea name="info[service][keterangan]" cols="50" rows="4" maxlength="255"></textarea></td>
        </tr>
    </table>
</div>

    <div style="margin:20px;text-align:center">
        <input type='submit' name='insert' value='Simpan'>
    </div>
</form>