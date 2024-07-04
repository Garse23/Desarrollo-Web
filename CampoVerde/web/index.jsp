<%@ page import="controladores.ProductoServlet" %>
<%@ page import="modelo.Producto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CampoVerde</title>
        <link rel="stylesheet" href="css/stylesindex.css" />
        
    </head>
    <% String nombreUsuario = (String) session.getAttribute("nombreUsuario");
   Integer rolUsuario = (Integer) session.getAttribute("rolUsuario");%>
    <body>
        <header>
            <div class="container-hero">
                <div class="container hero">
                    <div class="customer-support">

                    </div>

                    <div class="container-logo">
                        <img src="img/logoCampo.png" style="width: 90px;" alt="">
                        <h1 class="logo"><a href="/">Campo Verde </a></h1>
                    </div>

                    <div class="container-user">
                        <img src="img/person-fill.svg" alt="alt" style="width: 30px"/>
                        <div class="dropdown-content">
                            <%if (nombreUsuario != null) {
                            %>
                            <div class="col-3"></div>
                            <div class="col-2">
                                <span>Usuario: <%= nombreUsuario %></span>
                            </div>
                            <% 
                            if (rolUsuario != null) {
                            switch(rolUsuario) {
                            case 1:
                            %>
                            <a href="login.jsp">Modificar Usuario</a>
                            <a href="CerrarSesion">Cerrar Sesión</a>
                            <%
                                            break;
                                        case 2:
                            %>
                            <a href="listaPedidos.jsp">Administrador</a>
                            <a href="CerrarSesion">Cerrar Sesión</a>                
                            <%
                                            break;
                                        case 4:
                            %>
                            <a href="listaPedidos.jsp">Administrador</a>
                            <a href="CerrarSesion">Cerrar Sesión</a>    
                            <%
                            default:
                                break;
                        }
                    } 
                            %>
                            <% 
                            }else {
                            %>
                            <a href="login.jsp">Iniciar Sesión</a>
                            <a href="registro.jsp">Registrarse</a>
                            <% 
                                                } 
                            %>
                        </div>


                    </div>

                    <div class="container-user2">
                        <i class="fa-solid fa-basket-shopping"></i>
                    </div>
                </div>
            </div>

            <div class="container-navbar">
                <nav class="navbar container">
                    <i class="fa-solid fa-bars"></i>
                    <ul class="menu">
                        <li><a href="#">Inicio</a></li>
                        <li><a href="#">Categorias</a></li>
                        <li><a href="#">Destacados</a></li>
                        <li><a href="#">Sobre Nosotros</a></li>
                    </ul>

                    <form class="search-form">
                        <input type="search" placeholder="Buscar..." />
                        <button class="btn-search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </nav>
            </div>
        </header>

        <section class="banner">
            <div class="content-banner">
                <p>Primera Calidad</p>
                <h2>Productos <br />100% Naturales</h2>
                <a href="#">Comprar ahora</a>
            </div>
        </section>

        <main class="main-content">
            <br>

            <section class="container top-categories">
                <h1 class="heading-1">Mejores Categorías</h1>
                <div class="container-categories">
                    <div class="card-category category-moca">
                        <p>Café moca</p>
                        <span>Ver más</span>
                    </div>
                    <div class="card-category category-expreso">
                        <p>Expreso Americano</p>
                        <span>Ver más</span>
                    </div>
                    <div class="card-category category-capuchino">
                        <p>Capuchino</p>
                        <span>Ver más</span>
                    </div>
                </div>
            </section>

            <section class="container top-products">
                <h1 class="heading-1">Mejores Productos</h1>

                <div class="container-options">
                    <span class="active">Destacados</span>
                    <span>Más recientes</span>
                    <span>Mejores Vendidos</span>
                </div>


                <div class="container-fluid">
                    <div class="row">
                        <% 
                            ProductoServlet productoServlet = new ProductoServlet();
                            List<Producto> productos = null;
                            try {
                                productos = productoServlet.obtenerProductosHabilitados();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
            
                            if (productos != null) {
                                for (Producto producto : productos) {
                        %>
                        <div class="card col-3">
                            <div class="card-body">
                                <img src="imagenes/anuncio.png" alt="Producto" style="width: 100%">
                                <h3><%= producto.getNomProducto()%></h3>
                                <p>Precio: $<%= producto.getPrecioProducto() %></p>
                                <button class="btn btn-success">Agregar al carrito</button>
                            </div>
                        </div>
                        <% 
                                }
                            }
                        %>
                    </div>
                </div>

            </section>

            <section class="gallery">
                <img
                    src="img/gallery1.jpg"
                    alt="Gallery Img1"
                    class="gallery-img-1"
                    /><img
                    src="img/gallery2.jpg"
                    alt="Gallery Img2"
                    class="gallery-img-2"
                    /><img
                    src="img/gallery3.jpg"
                    alt="Gallery Img3"
                    class="gallery-img-3"
                    /><img
                    src="img/gallery4.jpg"
                    alt="Gallery Img4"
                    class="gallery-img-4"
                    /><img
                    src="img/gallery5.jpg"
                    alt="Gallery Img5"
                    class="gallery-img-5"
                    />
            </section>

            <section class="container specials">
                <h1 class="heading-1">Especiales</h1>

                <div class="container-products">
                    <!-- Producto 1 -->
                    <div class="card-product">
                        <div class="container-img">
                            <img src="img/cafe-irish.jpg" alt="Cafe Irish" />
                            <span class="discount">-13%</span>
                            <div class="button-group">
                                <span>
                                    <i class="fa-regular fa-eye"></i>
                                </span>
                                <span>
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-code-compare"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-card-product">
                            <div class="stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                            <h3>Cafe Irish</h3>
                            <span class="add-cart">
                                <i class="fa-solid fa-basket-shopping"></i>
                            </span>
                            <p class="price">$4.60 <span>$5.30</span></p>
                        </div>
                    </div>
                    <!-- Producto 2 -->
                    <div class="card-product">
                        <div class="container-img">
                            <img
                                src="img/cafe-ingles.jpg"
                                alt="Cafe incafe-ingles.jpg"
                                />
                            <span class="discount">-22%</span>
                            <div class="button-group">
                                <span>
                                    <i class="fa-regular fa-eye"></i>
                                </span>
                                <span>
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-code-compare"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-card-product">
                            <div class="stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                            <h3>Cafe Inglés</h3>
                            <span class="add-cart">
                                <i class="fa-solid fa-basket-shopping"></i>
                            </span>
                            <p class="price">$5.70 <span>$7.30</span></p>
                        </div>
                    </div>
                    <!--  -->
                    <div class="card-product">
                        <div class="container-img">
                            <img src="img/cafe-viena.jpg" alt="Cafe Viena" />
                            <span class="discount">-30%</span>
                            <div class="button-group">
                                <span>
                                    <i class="fa-regular fa-eye"></i>
                                </span>
                                <span>
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-code-compare"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-card-product">
                            <div class="stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <h3>Cafe Viena</h3>
                            <span class="add-cart">
                                <i class="fa-solid fa-basket-shopping"></i>
                            </span>
                            <p class="price">$3.85 <span>$5.50</span></p>
                        </div>
                    </div>
                    <!--  -->
                    <div class="card-product">
                        <div class="container-img">
                            <img src="img/cafe-liqueurs.jpg" alt="Cafe Liqueurs" />
                            <div class="button-group">
                                <span>
                                    <i class="fa-regular fa-eye"></i>
                                </span>
                                <span>
                                    <i class="fa-regular fa-heart"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-code-compare"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-card-product">
                            <div class="stars">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </div>
                            <h3>Cafe Liqueurs</h3>
                            <span class="add-cart">
                                <i class="fa-solid fa-basket-shopping"></i>
                            </span>
                            <p class="price">$5.60</p>
                        </div>
                    </div>
                </div>
            </section>

            <section class="container blogs">
                <h1 class="heading-1">Sobre Nosotros</h1>

                <div class="container-blogs">
                    <div class="card-blog">
                        <div class="container-img">
                            <img src="img/blog-1.jpg" alt="Imagen Blog 1" />
                            <div class="button-group-blog">
                                <span>
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-link"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-blog">
                            <h3>Ubicanos</h3>
                            <span>Perú ICA-ICA</span>
                            <p>
                                Encuentranos en la urb.campo Alegre C-105
                                Referencia al frente de divertiland en el
                                camino de la Javier Prado

                                <br>
                                <br>
                                <br>
                            </p>
                            <div class="btn-read-more">Leer más</div>
                        </div>
                    </div>
                    <div class="card-blog">
                        <div class="container-img">
                            <img src="img/blog-2.jpg" alt="Imagen Blog 2" />
                            <div class="button-group-blog">
                                <span>
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-link"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-blog">
                            <h3>Nuestra Historia</h3>
                            <span>29 de Julio 2024</span>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing
                                elit. Iste, molestiae! Ratione et, dolore ipsum
                                quaerat iure illum reprehenderit non maxime amet dolor
                                voluptas facilis corporis, consequatur eius est sunt
                                suscipit?
                            </p>
                            <div class="btn-read-more">Leer más</div>
                        </div>
                    </div>
                    <div class="card-blog">
                        <div class="container-img">
                            <img src="img/blog-3.jpg" alt="Imagen Blog 3" />
                            <div class="button-group-blog">
                                <span>
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </span>
                                <span>
                                    <i class="fa-solid fa-link"></i>
                                </span>
                            </div>
                        </div>
                        <div class="content-blog">
                            <h3>Terminos y Condiciones</h3>
                            <span>29 de Julio 2024</span>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing
                                elit. Iste, molestiae! Ratione et, dolore ipsum
                                quaerat iure illum reprehenderit non maxime amet dolor
                                voluptas facilis corporis, consequatur eius est sunt
                                suscipit?
                            </p>
                            <div class="btn-read-more">Leer más</div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer class="footer">
            <div class="container container-footer">
                <div class="menu-footer">
                    <div class="contact-info">
                        <p class="title-footer">Información de Contacto</p>
                        <ul>
                            <li>
                                Dirección: Ica Subtanjalla :v
                            </li>
                            <li>Teléfono: 948 684 478</li>
                            <li>EmaiL: campoverdeORG@gmail.com</li>
                            <li>Siguenos como @CampoVerde en:</li>
                        </ul>
                        <div class="social-icons">
                            <span class="facebook">
                                <i class="fa-brands fa-facebook-f"></i>
                            </span>
                            <span class="twitter">
                                <i class="fa-brands fa-twitter"></i>
                            </span>
                            <span class="instagram">
                                <i class="fa-brands fa-instagram"></i>
                            </span>
                        </div>
                    </div>

                    <div class="information">
                        <p class="title-footer">Información</p>
                        <ul>
                            <li><a href="#">Acerca de Nosotros</a></li>
                            <li><a href="#">Información Delivery</a></li>
                            <li><a href="#">Politicas de Privacidad</a></li>
                            <li><a href="#">Términos y condiciones</a></li>
                            <li><a href="#">Contactános</a></li>
                        </ul>
                    </div>

                    <div class="my-account">
                        <p class="title-footer">Mi cuenta</p>

                        <ul>
                            <li><a href="#">Modificar Usuario</a></li>
                            <li><a href="#">Reembolsos</a></li>
                        </ul>
                    </div>

                    <div class="newsletter">
                        <p class="title-footer">Atención al cliente </p>

                        <div class="content">
                            <p>
                                +51 956-456-343
                            </p>
                            <p>
                                (021) 5654-2343
                            </p>
                        </div>
                    </div>
                </div>

                <div class="copyright">
                    <p>
                        Todos los derechos reservados Campo verde &copy; 2024
                    </p>

                    <img src="img/payment.png" alt="Pagos">
                </div>
            </div>
        </footer>

        <script
            src="https://kit.fontawesome.com/81581fb069.js"
            crossorigin="anonymous"
        ></script>
    </body>
</html>
