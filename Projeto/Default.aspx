<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Projeto.Default" %>

<%@ Register Src="~/UCGuest.ascx" TagPrefix="uc1" TagName="UCGuest" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

	<title>Tinder de Livros</title>

	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="/css/personal-css.css" />

	<style type="text/css">
		
	</style>
</head>
<body>
	<form id="form1" runat="server">

		<div class="container">
			<uc1:UCGuest runat="server" ID="UCGuest" />
			<header>
				<div class="container">
					<div class="intro-text">						
						<div class="intro-lead-in">É um Prazer Ver Você Por Aqui</div>
						<div class="intro-heading">Bem-Vindo ao #LPL</div>
						<a href="#sobre" class="page-scroll btn btn-xl text-wrap">Conheça Mais Sobre o Nosso Projeto</a>
					</div>
				</div>
			</header>
		</div>

		<!--Sobre o site -->
		<section id="sobre" class="white">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2 class="section-heading">Sobre Nós</h2>
						<h3 class="section-subheading text-muted">Somos um </h3>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-md-4">
						<span class="fa-stack fa-4x">
							<i class="fa fa-circle fa-stack-2x text-primary"></i>
							<i class="fa fa-shopping-cart fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">Único do Tipo</h4>
						<p class="text-muted">[o que o site pretende fazer]</p>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x">
							<i class="fa fa-circle fa-stack-2x text-primary"></i>
							<i class="fa fa-laptop fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">Descubra Novas Coisas</h4>
						<p class="text-muted">[leque de possibilidades de coisas que voce pode fazer com a plataforma]</p>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x">
							<i class="fa fa-circle fa-stack-2x text-primary"></i>
							<i class="fa fa-lock fa-stack-1x fa-inverse"></i>
						</span>
						<h4 class="service-heading">Divirta-Se</h4>
						<p class="text-muted">[use o site para seu entreterimento]</p>
					</div>
				</div>
			</div>
		</section>

		<!-- Team Section -->
		<section id="team" class="mint">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<h2>Nossa Incrível Equipe</h2>
						<h3 class="section-subheading text-muted">Feira de Ciências Colégio Bandeirantes</h3>
					</div>
				</div>
				<div class="row text-center">
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/droso.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>André Hatushikano</h4>
							<p class="text-muted">Droso</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/juliana.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Juliana Suyama</h4>
							<p class="text-muted">Sushi</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/livia.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Livia Nageishi</h4>
							<p class="text-muted">Ameixa</p>

						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/marina.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Marina Roschel</h4>
							<p class="text-muted">Mariana Rosquel</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/manoela.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Manoela Ribeiro</h4>
							<p class="text-muted">No Crushes, Just Books</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/sergio.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Sérgio Nascimento</h4>
							<p class="text-muted">O Maromba</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/veronica.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Verônica Dufrayer</h4>
							<p class="text-muted">Humanas na Veia</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/renato.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Renato</h4>
							<p class="text-muted">Prisoneiro</p>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="team-member">
							<img src="images/tina.jpg" class="img-responsive img-circle" height="255" width="255" alt="" />
							<h4>Tina Selles</h4>
							<p class="text-muted">Mito</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2 text-center">
						<p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
					</div>
				</div>
			</div>
		</section>

		<footer>
			<div class="white black-border">
				<div class="container row">
					<div class="col-md-4">
						<span class="copyright">Copyright &copy; Letras por Letras 2016</span>
					</div>
					<div class="col-md-4">
						<ul class="list-inline social-buttons">
							<li><a href="#"><i class="fa fa-twitter"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-facebook"></i></a>
							</li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a>
							</li>
						</ul>
					</div>
					<div class="col-md-4">
						<ul class="list-inline quicklinks">
							<li><a href="#">Privacy Policy</a>
							</li>
							<li><a href="#">Terms of Use</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</footer>

	</form>

	<script type="text/javascript" charset="utf-8" src="/js/jquery-2.2.1.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/utils.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<% if (UCGuest.AlgoDeuErrado == true) { %>
	<script type="text/javascript">
		$("#modalLogin").modal({ show: true, keyboard: true, background: true });
	</script>
<% } %>

	<script type="text/javascript">
		(function ($) {
			"use strict"; // Start of use strict

			// jQuery for page scrolling feature - requires jQuery Easing plugin
			$('a.page-scroll').bind('click', function (event) {
				var $anchor = $(this);
				$('html, body').stop().animate({
					scrollTop: ($($anchor.attr('href')).offset().top - 50)
				}, 1250, 'easeInOutExpo');
				event.preventDefault();
			});

			// Highlight the top nav as scrolling occurs
			$('body').scrollspy({
				target: '.navbar-fixed-top',
				offset: 51
			});

			// Closes the Responsive Menu on Menu Item Click
			$('.navbar-collapse ul li a').click(function () {
				$('.navbar-toggle:visible').click();
			});

			// Offset for Main Navigation
			$('#mainNav').affix({
				offset: {
					top: 100
				}
			})

		})(jQuery);
	</script>

</body>
</html>
