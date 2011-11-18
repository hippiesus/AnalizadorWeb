create or replace
procedure AGREGARREPARACION
(
  P_NOMBRECLI       IN cliente.nombre_cliente%TYPE  
, P_APELLIDOCLI     IN Cliente.apellido_cliente%TYPE  
, P_RUTCLI          IN cliente.rut_cliente%TYPE  
, P_DIRECCION       IN cliente.direccion_cliente%TYPE  
, P_TELEFONO        IN cliente.telefono_cliente%TYPE  
, P_TIPOREPARACION  IN guia_de_reparacion.tipo_reparacion%TYPE
, P_LUGARREPARACION IN guia_de_reparacion.lugar_reparacion%TYPE
, P_MARCA           IN marca.nombre_marca%TYPE  
, P_MODELO          IN modelo.nombre_modelo%TYPE  
, P_NSERIE          IN artefacto_cliente.n_serie%TYPE  
, P_TIPOARTEFACTO   IN tipo_artefacto.nombre_tipo_artefacto%TYPE  
, P_DESPERFECTO     IN guia_de_reparacion.desperfecto_cliente%TYPE
, P_ACCESORIO       IN accesorio.descripcion_accesorio%TYPE  
, P_TECNICO         IN VARCHAR2 
, P_PAGAREVISION    IN NUMBER
, P_nGuiaGarantia   IN guia_de_reparacion.id_guia%TYPE
, P_nGuiaRepar      OUT guia_de_reparacion.id_guia%TYPE
) as 

V_NOMBRECLI       cliente.nombre_cliente%TYPE                 := P_NOMBRECLI;
V_APELLIDOCLI     Cliente.apellido_cliente%TYPE               := P_APELLIDOCLI;  
V_RUTCLI          cliente.rut_cliente%TYPE                    := P_RUTCLI;
V_DIRECCION       cliente.direccion_cliente%TYPE              := P_DIRECCION; 
V_TELEFONO        cliente.telefono_cliente%TYPE               := P_TELEFONO; 
V_TIPOREPARACION  guia_de_reparacion.tipo_reparacion%TYPE     := P_TIPOREPARACION;
V_LUGARREPARACION guia_de_reparacion.lugar_reparacion%TYPE    := P_LUGARREPARACION;
V_MARCA           marca.nombre_marca%TYPE                     := P_MARCA;
V_MODELO          modelo.nombre_modelo%TYPE                   := P_MODELO;
V_NSERIE          artefacto_cliente.n_serie%TYPE              := P_NSERIE;
V_TIPOARTEFACTO   tipo_artefacto.nombre_tipo_artefacto%TYPE   := P_TIPOARTEFACTO;
V_DESPERFECTO     guia_de_reparacion.desperfecto_cliente%TYPE := P_DESPERFECTO;
V_ACCESORIO       accesorio.descripcion_accesorio%TYPE        := P_ACCESORIO; 
v_nGuiaGarantia   guia_de_reparacion.id_guia%TYPE             := P_nGuiaGarantia;
V_TECNICO         VARCHAR2(40)                                := P_TECNICO;
V_PAGAREVISION    NUMBER                                      := P_PAGAREVISION;
V_AUX_CLIENTE     NUMBER                                      := 0;
V_AUX_MODELO      NUMBER                                      := 0;
V_AUX_MODELO2     modelo.id_modelo%TYPE                       := 0;
V_AUX_MARCA       NUMBER                                      := 0;
V_AUX_MARCA2      marca.id_marca%TYPE                         := 0;
V_AUX_TIPOARTE    tipo_artefacto.id_tipo_artefacto%TYPE       := 0;
V_AUX_COSTO       tipo_artefacto.costo_revision%TYPE;
v_rut_funcionario funcionario.rut_funcionario%TYPE            := P_TECNICO;

BEGIN

IF v_tiporeparacion = 'Nueva' then

Select count(rut_cliente)
into v_aux_cliente
from cliente
where rut_cliente=v_rutcli;

Select count(id_marca)
into v_aux_marca
from marca
WHERE UPPER(translate(nombre_marca, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(translate(v_marca, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'));

Select count(id_modelo)
into v_aux_modelo
from modelo
WHERE UPPER(translate(nombre_modelo, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(translate(v_modelo, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'));

if v_aux_cliente = 0  then

    Insert into cliente values(v_rutcli,
                               v_nombrecli,
                               v_apellidocli,
                               v_telefono,
                               v_direccion);
else

Update cliente
SET telefono_cliente  = v_telefono,
    direccion_cliente = v_direccion
Where rut_cliente = v_rutcli;

end if;


if v_aux_marca = 0 then

    Insert into marca values(Seq_id_marca.NextVal,
                             v_marca);
    
end if;

if v_aux_modelo = 0 then
    
    Select id_tipo_artefacto
    into v_aux_tipoarte
    from tipo_artefacto
    where nombre_tipo_artefacto=v_tipoartefacto;
    
    Select id_marca
    into v_aux_marca2
    from marca
    WHERE UPPER(translate(nombre_marca, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(translate(v_marca, 'áéíóúÁÉÍ  Ú', 'aeiouAEIOU'));
    
    Insert into modelo values(Seq_id_modelo.NextVal,
                              v_aux_marca2,
                              v_aux_tipoarte,
                              v_modelo);
    
end if;

Select id_modelo
into v_aux_modelo2
from modelo
WHERE UPPER(translate(nombre_modelo, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU')) LIKE UPPER(translate(v_modelo, 'áéíóúÁÉÍÓÚ', 'aeiouAEIOU'));

Insert into artefacto_cliente Values(Seq_id_artefacto_cliente.NextVal,
                                     v_aux_modelo2,
                                     v_nserie);
                                     
Insert into guia_de_reparacion Values(Seq_id_guia.NextVal,
                                      v_rutcli,
                                      Seq_id_artefacto_cliente.CURRVAL,
                                      v_rut_funcionario,
                                      'En revisión',
                                      v_tiporeparacion,
                                      v_lugarreparacion,
                                      0,
                                      systimestamp,
                                      systimestamp,
                                      systimestamp,
                                      v_desperfecto);
                                      
                                      Select Seq_id_guia.CURRVAL 
                                      INTO P_nGuiaRepar
                                      from dual;
                                      
if v_pagarevision = 1 then
    
    Select costo_revision
    into V_AUX_COSTO
    from tipo_artefacto
    where nombre_tipo_artefacto = v_tipoartefacto;
    
    Insert into boleta Values(Seq_n_boleta.NextVal,
                              systimestamp);
                              
    Insert into paga_revision Values(v_rutcli,
                                     Seq_id_guia.CURRVAL,
                                     Seq_id_artefacto_cliente.CURRVAL,
                                     Seq_n_boleta.CURRVAL);   
                                     

end if;

else
Update guia_de_reparacion
Set tipo_reparacion = 'Garantia'
Where id_guia=P_nGuiaGarantia;

end if;



END AGREGARREPARACION;
