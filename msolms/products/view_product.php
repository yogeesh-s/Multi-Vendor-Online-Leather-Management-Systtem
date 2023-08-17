<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT  p.*, s.shop_name as seller, c.name as `category` FROM `product_list` p inner join seller_list s on p.seller_id = s.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
        echo "<script> alert('Unkown Product ID.'); location.replace('./?page=products') </script>";
        exit;
    }
}else{
    echo "<script> alert('Product ID is required.'); location.replace('./?page=products') </script>";
    exit;
}
?>

<style>
    #prod-img-holder {
        height: 45vh !important;
        width: calc(100%);
        overflow: hidden;
    }

    #prod-img {
        object-fit: scale-down;
        height: calc(100%);
        width: calc(100%);
        transition: transform .3s ease-in;
    }
    #prod-img-holder:hover #prod-img{
        transform:scale(1.2);
    }
</style>
<div class="content py-3">
    <div class="card card-outline card-primary rounded-0 shadow">
        <div class="card-header">
            <h5 class="card-title"><b>Product Details</b></h5>
        </div>
        <div class="card-body">
            <div class="container-fluid">
                <div id="msg"></div>
                <div class="row">
                    <div class="col-lg-4 col-md-5 col-sm-12 text-center">
                        <div class="position-relative overflow-hidden" id="prod-img-holder">
                            <img src="<?= validate_image(isset($image_path) ? $image_path : "") ?>" alt="<?= $row['name'] ?>" id="prod-img" class="img-thumbnail bg-gradient-gray">
                        </div>
                    </div>
                    <div class="col-lg-8 col-md-7 col-sm-12">
                        <h3><b><?= $name ?></b></h3>
                        <div class="d-flex w-100">
                            <div class="col-auto px-0"><small class="text-muted">Seller: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0"><small class="text-muted">&nbsp <?= $seller ?></small></p></div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Category: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0"><small class="text-muted">&nbsp <?= $category ?></small></p></div>
                        </div>
                        <div class="d-flex">
                            <div class="col-auto px-0"><small class="text-muted">Price: </small></div>
                            <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><small class="text-primary">₹ <?= format_num($price) ?></small></p></div>
                        </div>
                        <div class="row align-items-end">
                            <div class="col-md-3 form-group">
                                <input type="number" min = "1" id= 'qty' value="1" class="form-control rounded-0 text-center">
                            </div>
                            <div class="row-md-3 form-group">
                                <button class="btn btn-warning btn-flat" type="button" id="add_to_cart"><i class="fa fa-cart-plus"></i> Add to Cart</button>
                                <button class="btn btn-success btn-flat" type="button" id="buy_now"><i class="fa fa-bolt"></i></i> Buy Now</button>
                            </div>
                        </div>
                        <div class="w-100"><?= html_entity_decode($description) ?></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT  p.*, s.shop_name as seller, c.name as `category` FROM `product_list` p inner join seller_list s on p.seller_id = s.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.id = '{$_GET['id']}'");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }else{
        echo "<script> alert('Unkown Product ID.'); location.replace('./?page=products') </script>";
        exit;
    }
}else{
    echo "<script> alert('Product ID is required.'); location.replace('./?page=products') </script>";
    exit;
}
?>
<?php
    $result = false;
    $product_id = isset($id) ? $id : ''; 
    $query = "SELECT user_id FROM order_list ol WHERE ol.id IN (SELECT order_id FROM order_items oi WHERE oi.product_id = ?) AND ol.status = 4";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $user_ids = array();
        while ($row = $result->fetch_assoc()) {
            $user_ids[] = $row['user_id'];
        }
        foreach ($user_ids as $user_id) {
            if($user_id==$_settings->userdata('id'))
                $result = true;
            else
                $result = false;
        }
    } else {
        $result = false;
    }
    $stmt->close();
    if($_settings->userdata('id')!=NULL && $result)
    {
        ?>
    <div class="card card-outline card-primary rounded-0 shadow">
        <form id="review-frm" action="classes/addReview.php" method="post">
            <div class="form-group m-3">
                <input type="hidden" name="product_id" value="<?= isset($id) ? $id : '' ?>">
                <input type="hidden" name="user_id" value="<?php echo $_settings->userdata('id'); ?>">
                <label for="description">Write Your Review</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                <button type="submit" class="btn btn-primary mt-2">Submit</button>
            </div>
        </form>
    </div>
    <?php
    }
?>

    <?php
    $product_id = isset($id) ? $id : '';
    $query = $conn->query("SELECT r.description, u.firstname, u.middlename, u.lastname,u.avatar FROM Reviews r, User_list u WHERE r.user_id = u.id and product_id = '".$product_id."'");

    if ($query->num_rows > 0) {
        while ($row = $query->fetch_assoc()) {
            $fullName = $row['firstname'] . ' ' . $row['middlename'] . ' ' . $row['lastname'];
            $description = $row['description'];
            $avatar = $row['avatar'];
            echo "<script> alert(".$avatar.")</script>";
            ?>
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-1">
                                <img src="<?= $avatar ?>" class="square rounded-circle img-fluid"/>
                            </div>
                            <div class="col-md-9">
                                <p>
                                    <a class="float-left"><strong><?= $fullName ?></strong></a>
                                    <!--
                                    <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                    <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                    <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                                    <span class="float-right"><i class="text-warning fa fa-star"></i></span>-->
                            </p>
                            <div class="clearfix"></div>
                                <p><?= $description ?></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php
        }
    }
    ?>
</div>

<script>
    function add_to_cart(){
        var pid = '<?= isset($id) ? $id : '' ?>';
        var qty = $('#qty').val();
        var el = $('<div>')
        el.addClass('alert alert-danger')
        el.hide()
        $('#msg').html('')
        start_loader()
        $.ajax({
            url:_base_url_+'classes/Master.php?f=add_to_cart',
            method:'POST',
            data:{product_id:pid,quantity:qty},
            dataType:'json',
            error:err=>{
                console.error(err)
                alert_toast('An error occurred.','error')
                end_loader()
            },
            success:function(resp){
                if(resp.status =='success'){
                    location.reload()
                }else if(!!resp.msg){
                    el.text(resp.msg)
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }else{
                    el.text("An error occurred. Please try to refresh this page.")
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }
                end_loader()
            }
        })
    }
    function buy_now(){
        var pid = '<?= isset($id) ? $id : '' ?>';
        var qty = $('#qty').val();
        var el = $('<div>')
        el.addClass('alert alert-danger')
        el.hide()
        $('#msg').html('')
        start_loader()
        $.ajax({
            url:_base_url_+'classes/Master.php?f=add_to_cart',
            method:'POST',
            data:{product_id:pid,quantity:qty},
            dataType:'json',
            error:err=>{
                console.error(err)
                alert_toast('An error occurred.','error')
                end_loader()
            },
            success:function(resp){
                if(resp.status =='success'){
                    location.reload()
                }else if(!!resp.msg){
                    el.text(resp.msg)
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }else{
                    el.text("An error occurred. Please try to refresh this page.")
                    $('#msg').append(el)
                    el.show('slow')
                    $('html, body').scrollTop(0)
                }
                location.href = "./?page=orders/cart"
                end_loader()
            }
        })
    }
    $(function(){
        $('#add_to_cart').click(function(){
            if('<?= $_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3 ?>'){
                add_to_cart();
            }else{
                location.href = "./login.php"
            }
        })
        $('#buy_now').click(function(){
            if('<?= $_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3 ?>'){
                buy_now();
            }else{
                location.href = "./login.php"
            }
        })
  })
</script>