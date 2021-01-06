<section class="section">
    <div class="section-header">
        <h1><?php echo $title ?></h1>
    </div>

    <div class="section-body">
        <div class="card">
            <div class="card-header">
                <a class="btn btn-danger" href="<?php echo base_url('recapitulation') ?>">Kembali</a>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="row">
                                    <h6 class="ml-4 text-primary">Total Pemilih : <?php echo $election_grand_total ?></h6>
                                    <h6 class="ml-4 text-primary">Sah : <?php echo $election_sah ?></h6>
                                    <h6 class="ml-4 text-primary">Tidak Sah : <?php echo $election_tidak_sah ?></h6>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table width="100%" class="table table-sm table-striped dataTables">
                                    <thead>
                                        <tr>
                                            <td scope="col">No</td>
                                            <td scope="col">Nama</td>
                                            <td align="right" scope="col">Jumlah Suara</td>
                                            <td align="right" scope="col">Persentase</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $i = 1;
                                        foreach ($result_data as $item_data) :
                                            $sah = 0;
                                            foreach ($result_data_sah as $item_data2) :
                                                if ($item_data->candidate_id == $item_data2->candidate_id) {
                                                    $sah = $item_data2->election_sah;
                                                }
                                            endforeach;
                                            $tidak_sah = 0;
                                            foreach ($result_data_tidak_sah as $item_data3) :
                                                if ($item_data->candidate_id == $item_data3->candidate_id) {
                                                    $tidak_sah = $item_data3->election_tidak_sah;
                                                }
                                            endforeach;
                                            $percentage = 0;
                                            if ($election_sah > 0) {
                                                $percentage = ($sah * 100) / $election_sah;
                                            }
                                        ?>
                                            <tr>
                                                <td><?php echo $i ?></td>
                                                <td>
                                                    <?php echo $item_data->candidate_name ?>
                                                </td>
                                                <td align="right"><?php echo $sah ?></td>
                                                <td align="right"><b><?php echo round($percentage, 2) . "%" ?></b></td>
                                            </tr>
                                        <?php
                                            $i++;
                                        endforeach; ?>
                                        <tr>
                                            <td></td>
                                            <td><b>Suara Tidak Sah</b></td>
                                            <td align="right"><?php echo $election_tidak_sah ?></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>