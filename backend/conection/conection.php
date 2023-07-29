<?php
class conection
{
    private $bd = null;
    private $host = "localhost";
    private $user = "postgres";
    private $password = "DB4Master";
    public function __construct()
    {
        $this->bd == null? $this->bd = new PDO('pgsql:dbname=postgres host=' . $this->host, $this->user, $this->password): '';
    }

    public function executed($sql)
    {
        try {
            $sentencia = $this->bd->prepare($sql);
            $sentencia->execute();
            return $sentencia;
        } catch (\Throwable $th) {
            echo "Error en consulta sql: ".$th->getMessage();
        }
    }
}
