<div class="col-lg-12 py-5">
    
    <br>
    <div class="contain-fluid">
        <div class="card card-outline card-dark shadow rounded-0">
            <div class="card-body rounded-0">
                <div class="container-fluid">
                    <h3 class="text-center">Natural Leather</h3>
                    <hr/>
                        <?php include("welcome2.html") ?>
                    </div>
                </div>
            </div>
        </div>

        <!--Categories-->
            <h3 class="text-center"><b>Categories</b></h3>
            <center><hr class="w-25"></center>
            <div class="row" id="product_list">
                <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                    <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                    <a href="./?page=products&cids=14" class="card shadow rounded-0 text-reset text-decoration-none">
                    <div class="product-img-holder position-relative">
                        <img src="./uploads/men.jpg" alt="mens-image" class="img-top product-img bg-gradient-gray">
                    </div>
                    <div class="card-body border-top border-gray">
                        <h4 class="card-title text-truncate w-100 text-center"><b>Men</b></h4>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                    <a href="./?page=products&search=Female" class="card shadow rounded-0 text-reset text-decoration-none">
                    <div class="product-img-holder position-relative">
                        <img src="./uploads/women.jpg" alt="mens-image" class="img-top product-img bg-gradient-gray">
                    </div>
                    <div class="card-body border-top border-gray">
                        <h4 class="card-title text-truncate w-100 text-center"><b>Women</b></h4>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                    <a href="./?page=products&search=Children" class="card shadow rounded-0 text-reset text-decoration-none">
                    <div class="product-img-holder position-relative">
                        <img src="./uploads/child.jpg" alt="mens-image" class="img-top product-img bg-gradient-gray">
                    </div>
                        <div class="card-body border-top border-gray">
                            <h4 class="card-title text-truncate w-100 text-center"><b>Children</b></h4>
                        </div>
                </div>
                </a>
            </div>
        </div>

        <!-- Products -->
        <!--<div class="clear-fix mb-3"></div>
        <h3 class="text-center"><b>Products</b></h3>
        <center><hr class="w-25"></center>
        <div class="row" id="product_list">
            <?php 
            $products = $conn->query("SELECT p.*, v.shop_name as seller, c.name as `category` FROM `product_list` p INNER JOIN seller_list v ON p.seller_id = v.id INNER JOIN category_list c ON p.category_id = c.id WHERE p.delete_flag = 0 AND p.`status` = 1 AND p.seller_id NOT IN (SELECT id FROM `seller_list` WHERE delete_flag != 0 or status != 1) AND (p.name LIKE '%Pure Leather%' or p.description LIKE '%Pure Leather%' or c.name LIKE '%Pure Leather%' or v.shop_name LIKE '%Pure Leather%') ORDER BY RAND() limit 4");
            while($row = $products->fetch_assoc()):
            ?>
            <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                <div class="product-img-holder position-relative">
                    <img src="<?= validate_image($row['image_path']) ?>" alt="Product-image" class="img-top product-img bg-gradient-gray">
                </div>
                    <div class="card-body border-top border-gray">
                        <h5 class="card-title text-truncate w-100"><?= $row['name'] ?></h5>
                        <div class="d-flex w-100">
                            <div class="col-auto px-0"><small class="text-muted">Seller: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><small class="text-muted"><?= $row['seller'] ?></small></p></div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Category: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><small class="text-muted"><?= $row['category'] ?></small></p></div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Price: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-primary">₹ <?= format_num($row['price']) ?></small></p></div>
                        </div>
                    </div>
                </a>
            </div>
            <?php endwhile; ?>
        </div>
        <div class="clear-fix mb-2"></div>
        <div class="text-center">
            <a href="./?page=products&search=Pure%20Leather" class="btn btn-large btn-primary rounded-pill col-lg-3 col-md-5 col-sm-12">Explore More Products</a>
        </div>-->
    </div>
</div>