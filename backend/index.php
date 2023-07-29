<?php
    require_once 'controllers/controller.php';

    if(isset($_REQUEST["op"]) ){
        $op = $_REQUEST['op'];
        $controller = new controller();

        $result = "{}";

        switch ($op) {
            case 1:
                $result = $controller->login($_POST);
                break;
            
            case 2:
                $result = $controller->guardaVuelo($_POST);
                break;

            case 3:
                $result = $controller->listarVuelos($_POST);
                break;

            case 4:
                $result = $controller->cerrarVuelo($_POST);
                break;
            
            default:
                $result = array("status" => 'error', "message" => "No se ha implementado la opcion ".$op." en esta api");
                break;
        }

        echo json_encode($result);
    }else{
        echo "Api php TECHNOKEY";
    }

    
