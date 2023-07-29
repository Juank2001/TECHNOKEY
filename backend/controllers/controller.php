<?php
require_once 'conection/conection.php';
date_default_timezone_set('America/Bogota');

class controller
{
    private $con = null;

    public function __construct()
    {
        $this->con == null ? $this->con = new conection() : '';
    }

    public function login($data)
    {
        try {
            $continuar = isset($data['usuario']) && isset($data['password']) ? true : false;
            if ($continuar) {
                $sql = "select * from users where email = '" . $data['usuario'] . "'";
                $sentencia = $this->con->executed($sql);
                $responseSql = $sentencia->fetchAll(\PDO::FETCH_ASSOC);

                if (count($responseSql) > 0) {
                    if ($responseSql[0]['password'] == $data['password']) {
                        $response = array("status" => "success", "details" => $responseSql);
                    } else {
                        $response = array("status" => 'error', "message" => "La contraseña no coincide");
                    }
                } else {
                    $response = array("status" => 'error', "message" => "El usuario no existe");
                }
            } else {
                $response = array("status" => 'error', "message" => "No se enviaron datos para esta opción");
            }

            return $response;
        } catch (\Throwable $th) {
            return array("status" => 'error', "message" => "Error: " . $th->getMessage());
        }
    }

    public function guardaVuelo($data)
    {
        try {
            $continuar = isset($data['origen']) && isset($data['destino']) && isset($data['costo']) ? true : false;
            if ($continuar) {
                $data['fecha'] = date("Y/m/d");
                $data['hora_salida'] = date("h:i:s");

                $sql = "insert into vuelos (fecha, hora_salida, destino, origen, costo) values ('" . $data['fecha'] . "', '" . $data['hora_salida'] . "', '" . $data['destino'] . "', '" . $data['origen'] . "', '" . $data['costo'] . "')";
                $sentencia = $this->con->executed($sql);
                $response = array("status" => 'success', "message" => "Vuelo creado correctamente", "details" => $sentencia);
            } else {
                $response = array("status" => 'error', "message" => "No se enviaron datos para esta opción");
            }

            return $response;
        } catch (\Throwable $th) {
            return array("status" => 'error', "message" => "Error: " . $th->getMessage());
        }
    }

    public function listarVuelos($data)
    {
        try {
            $continuar = isset($data['limit']) && isset($data['offset']) ? true : false;
            if ($continuar) {

                $sql = "select * from vuelos order by vuelo_id asc limit ".$data['limit']." offset ".$data['offset'];
                $sentencia = $this->con->executed($sql);
                $responseSql = $sentencia->fetchAll(\PDO::FETCH_ASSOC);

                if (count($responseSql) > 0) {
                    $response = array("status" => 'success', "details" => $responseSql);
                } else {
                    $response = array("status" => 'error', "message" => "No hay vuelos para consultar");
                }
            } else {
                $response = array("status" => 'error', "message" => "No se enviaron datos para esta opción");
            }

            return $response;
        } catch (\Throwable $th) {
            return array("status" => 'error', "message" => "Error: " . $th->getMessage());
        }
    }

    public function cerrarVuelo($data)
    {
        try {
            $continuar = isset($data['id']) ? true : false;
            if ($continuar) {

                $sql = "select * from vuelos where vuelo_id = " . $data['id'];

                $sentencia = $this->con->executed($sql);
                $responseSql = $sentencia->fetchAll(\PDO::FETCH_ASSOC);

                if (count($responseSql) > 0) {

                    //$cadena = strtotime($responseSql[0]["hora_salida"]);
                    $horaInicio = new DateTime($responseSql[0]["hora_salida"]);
                    $horaTermino = new DateTime(date("h:i:s"));

                    $interval = $horaInicio->diff($horaTermino);
                    if (strlen($interval->h) == 1) {
                        
                        $h = "0".$interval->h;
                    }else{
                        $h = $interval->h;
                    }
                    if (strlen($interval->i) < 2) {
                        $i = "0".$interval->i;
                    }else{
                        $i = $interval->i;
                    }
                    if (strlen($interval->s) < 2) {
                        $s = "0".$interval->s;
                    }else{
                        $s = $interval->s;
                    }

                    //echo $h.$i.$s;

                    $diferencia = $h . ":" . $i . ":" . $s;
                    $sql = "update vuelos set hora_llegada = '".date("h:i:s")."', tiempo='".$diferencia."' where vuelo_id = ".$data['id']." ";
                    $sentencia = $this->con->executed($sql);



                    $response = array("status" => 'success', "message" => "Vuelo cerrado", "details" => $sql);
                } else {
                    $response = array("status" => 'error', "message" => "No hay vuelos para consultar");
                }
            } else {
                $response = array("status" => 'error', "message" => "No se enviaron datos para esta opción");
            }

            return $response;
        } catch (\Throwable $th) {
            return array("status" => 'error', "message" => "Error: " . $th->getMessage());
        }
    }
}
