<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>
<!DOCTYPE html>
<html lang="en">


<head>
	<!-- load file head -->
	<?php $this->load->view('admin/_template/head.php'); ?>
	<!-- ========================== -->
</head>

<!-- load file navbar  -->
<?php $this->load->view('admin/_template/navbar.php'); ?>
<!-- ==========================  -->

<body id="page-top">

	<div id="wrapper">

		<!-- load file sidebar  -->
		<?php $this->load->view('admin/_template/sidebar.php'); ?>
		<!-- =======================   -->

		<div id="content-wrapper">

			<div class="container-fluid">

				<!-- load file Breadcrumbs-->
				<?php $this->load->view('admin/_template/breadcrumbs.php'); ?>
				<!-- ========================== -->
				<div class="card mb-3">
					<div class="card-header">
						<i class="fas fa-user"></i>
						Data alternatif | <a href="<?php echo site_url('admin/add_alternatif') ?>"><i class='fas fa-plus'></i>Tambah</a></div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-sm table-striped" id="dataTable" width="100%" cellspacing="0">
								<thead class="thead-inverse text-center">
									<tr>

										<th class="">NIK Penduduk</th>
										<th class="">Nama Penduduk</th>
										<?php 
                    $queryAspek = $this->db->query("
                                                    select tb_aspek.id_aspek, 
                                                    COUNT(tb_sub_kriteria.id_aspek) AS jumlah_sub,
                                                    tb_aspek.nama_aspek 
                                                    from tb_aspek LEFT JOIN 
                                                    tb_sub_kriteria ON 
                                                    tb_aspek.id_aspek = tb_sub_kriteria.id_aspek
                                                    GROUP BY tb_aspek.id_aspek
                                                    order by id_aspek asc
                                                    "); 

                    foreach ($queryAspek->result() as $tampilAspek) {
                ?>
										<th class="" colspan='<?php echo $tampilAspek->jumlah_sub; ?>'>
											<?php echo $tampilAspek->nama_aspek; ?>
										</th>
										<?php
                    } 
                 ?>
									</tr>
									<tr>
										<th> </th>
										<th> </th>
										<?php 
                    $querySubKriteria = $this->db->query("
                                                    select id_sub_kriteria,
                                                    id_aspek, 
                                                    nama_sub_kriteria,
                                                    keterangan 
                                                    from tb_sub_kriteria 
                                                    order by id_aspek,keterangan asc"); 

                    foreach ($querySubKriteria->result() as $tampilSubKriteria) {
                ?>
										<th class="">
											<?php echo $tampilSubKriteria->nama_sub_kriteria; ?><br>
											<?php echo $tampilSubKriteria->keterangan; ?><br>
										</th>
										<?php
                    } 
                 ?>
									</tr>
								</thead>
								<tbody>
									<form action="<?php base_url('admin/hasil') ?>" method="post">
										<?php foreach ($alternatif as $tampil_alternatif) {
                                    ?>
										<tr class="text-center">
											<td>
												<?php echo $tampil_alternatif->kode_alternatif ?>
											</td>
											<td>
												<?php echo $tampil_alternatif->nama_alternatif ?>
											</td>

											<?php foreach ($sub_kriteria as $tampil_sub_kriteria) {
                                         ?>
											<td class="">
												<div class="form-group">
													<label class="sr-only" for="inputName">Id Penduduk</label>
													<input type="hidden" class="form-control form-control-sm <?php echo form_error('id_alternatif') ? 'is-invalid':'' ?>"
													 name="id_alternatif[]" id="id_alternatif" value="<?php echo $tampil_alternatif->id_alternatif ?>">
													<div class="invalid-feedback">
														<?php echo form_error('id_alternatif') ?>
													</div>
												</div>
												<div class="form-group">
													<label class="sr-only" for="inputName">Id Sub Kriteria</label>
													<input type="hidden" class="form-control form-control-sm <?php echo form_error('id_sub_kriteria') ? 'is-invalid':'' ?>"
													 name="id_sub_kriteria[]" id="id_sub_kriteria" value="<?php echo $tampil_sub_kriteria->id_sub_kriteria ?>">
													<div class="invalid-feedback">
														<?php echo form_error('id_sub_kriteria') ?>
													</div>
												</div>
												<div class="form-group">
													<label for=""></label>
													<select class="form-control form-control-sm <?php echo form_error('skor') ? 'is-invalid':'' ?>" name="skor[]"
													 id="skor">

														<!-- <option value=''>Skor</option> -->
														<option value='5'>5</option>
														<option value='4'>4</option>
														<option value='3'>3</option>
														<option value='2'>2</option>
														<option value='1'>1</option>
													</select>
													<div class="invalid-feedback">
														<?php echo form_error('skor') ?>
													</div>
											</td>
											<?php } ?>
										</tr>
										<?php } ?>
										<tr>
											<br>
											<td>
												<button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Proses Hitung</button>
												
											</td>
											<td>
											<a href="<?php echo site_url('admin') ?>" class="btn btn-primary"><i class="fas fa-arrow-alt-circle-left"></i>
													Kembali</a>
											</td>
										</tr>
									</form>
								</tbody>
							</table>
						</div>
					</div>
				</div>


			</div>
			<!-- /.container-fluid -->

			<!-- load file Sticky Footer -->
			<?php $this->load->view('admin/_template/footer.php'); ?>
			<!-- ------------------------- -->

			<!-- /.content-wrapper -->

		</div>
		<!-- /#wrapper -->

		<!-- load file Scroll to Top Button-->
		<?php $this->load->view('admin/_template/scrolltop.php'); ?>
		<!-- ---------------------------- -->

		<!-- load file Modal-->
		<?php $this->load->view('admin/_template/modal.php'); ?>
		<!-- ------------------------- -->

		<!-- Bootstrap core JavaScript-->
		<?php $this->load->view('admin/_template/js.php'); ?>
		<!-- ------------------------------  -->

		<script>
			function deleteConfirm(url) {
				$('#btn-delete').attr('href', url);
				$('#deleteModal').modal();
			}

		</script>

</body>

</html>
