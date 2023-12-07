<?php
$sql = "SELECT * FROM user WHERE id_user='{$_SESSION['id_user']}'";
$query = query($sql);
$data = mysqli_fetch_array($query);
?>

<div id="header">
    <div id="top-bar">
        <div id="hello"><?php echo 'Halo <u>'.$data['namalengkap'].'</u>';?>, </div>
        <div id="date">Hari ini: <?php echo date('d'),' ',monthToId(date('m')),' ', date('Y H:i');?> wib</div>
        <div id="appname">E-FASI <b>PENGADILAN AGAMA CIAMIS</b></div>
    </div>
    
   <ul id="menu">
    <?php $totalNewFPK = countFPK(); ?>

    <li<?php echo $page == 'home' ? ' class="active"' : ''; ?>>
        <a href="<?php echo APPURL; ?>/home/">Dashboard</a>
    </li>

    <li<?php echo $page == 'kendaraan' ? ' class="active"' : ''; ?>>
        <a href="<?php echo APPURL; ?>/kendaraan/">Data</a>
    </li>
         <!-- KHUSUS ADMIN  -->
         <?php if ($_SESSION['tipe_user'] == 'admin') : ?>     
    <li<?php echo $page == 'penggunakendaraan' ? ' class="active"' : ''; ?>>
        <a href="<?php echo APPURL; ?>/penggunakendaraan/">Data Pengguna</a>
    </li>
        <?php endif; ?>
        <!-- KHUSUS ADMIN  -->
    <?php if ($_SESSION['tipe_user'] == 'admin') : ?>
    <li<?php echo $page == 'penggunaaplikasi' ? ' class="active"' : ''; ?>>
        <a href="<?php echo APPURL; ?>/penggunaaplikasi/">Data Pengguna Aplikasi</a>
    </li>
    <?php endif; ?>
    <li<?php echo $page == 'asuransi' ? ' class="active"':'';?>><a href="<?php echo APPURL;?>/asuransi/">Data Riwayat</a><li>
         <!-- KHUSUS ADMIN  -->
    <?php if ($_SESSION['tipe_user'] == 'admin') : ?>
        <li<?php echo $page == 'laporan' ? ' class="active"' : ''; ?>>
            <a href="<?php echo APPURL; ?>/laporan/">Laporan</a>
        </li>
    <?php endif; ?>

    <li<?php echo $page == 'changepassword' ? ' class="active"' : ''; ?>>
        <a href="<?php echo APPURL; ?>/changepassword/">Ganti Password</a>
    </li>

    <li>
        <a href="<?php echo APPURL; ?>/login/logout.php">Logout</a>
    </li>
</ul>

</div>
    