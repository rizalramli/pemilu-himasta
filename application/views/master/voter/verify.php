<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HIMASTA ITS</title>
    <link rel="icon" type="image/png" href="<?php echo base_url('assets/logo/logo.png') ?>">

    <!-- panggil assets CSS -->
    <?php $this->load->view('layouts/css.php'); ?>
</head>

<body>
    <div id="app">
        <section class="section">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                        <div class="login-brand" style="margin-bottom:15px !important;">
                            <img src="<?php echo base_url('assets/logo/logo.png') ?>" alt="logo" width="130" class="shadow-light rounded-circle">
                        </div>
                        <div class="card card-primary">
                            <h5 class="text-center text-primary mt-4">Aktivasi Akun</h5>
                            <div class="card-body">
                                <form action="<?php echo base_url('verify/submit/store') ?>" method="post">
                                    <div class="form-group">
                                        <div class="d-block">
                                            <label for="name">Nama Mahasiswa</label>
                                        </div>
                                        <input type="hidden" name="email" value="<?php echo $email ?>">
                                        <input id="name" type="text" class="form-control form-control-sm" name="name" value="<?php echo set_value('name') ?>">
                                        <span class="text-danger"><?php echo form_error('name'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <div class="d-block">
                                            <label for="angkatan">Angkatan</label>
                                        </div>
                                        <input id="angkatan" type="text" class="form-control form-control-sm" name="angkatan" value="<?php echo set_value('angkatan') ?>">
                                        <span class="text-danger"><?php echo form_error('angkatan'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <div class="d-block">
                                            <label for="password">Password Baru</label>
                                        </div>
                                        <input id="password" type="password" class="form-control form-control-sm" name="password">

                                        <div class="custom-control custom-checkbox mt-2">
                                            <input onclick="showPassword()" type="checkbox" name="remember" class="custom-control-input" tabindex="3" id="remember-me">
                                            <label class="custom-control-label" for="remember-me">Show Password</label>
                                        </div>

                                        <span class="text-danger"><?php echo form_error('password'); ?></span>
                                    </div>

                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block" tabindex="4">
                                            Aktivasi
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- panggil assets js -->
    <?php $this->load->view('layouts/js.php'); ?>
    <script>
        function showPassword() {
            var x = document.getElementById("password");
            if (x.type === "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
    </script>
</body>

</html>