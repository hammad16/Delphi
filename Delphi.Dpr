unit Alumnos;
interface
uses DatosValidos,Dialogs,Forms,StdCtrls,SysUtils;

type
	NombreCampos=(Nombre,Apellido, Edad, Peso, Altura);

	Editores = array[NombreCampos] of TEdit;

	TAlumno = class
    Campos: array[NombreCampos] of TDatoTexto;
    constructor Crea(const elEdit: Editores);
    function    MostrarDatos: boolean;
  end;

implementation

constructor TAlumno.Crea(const elEdit: Editores);
begin
 inherited Create;
 Campos[Nombre]:=TDatoTexto.CreaInicia('Nombre: ',
           elEdit[Nombre].Text, elEdit[Nombre]);
 Campos[Apellido]:=TDatoTexto.CreaInicia('Apellido:',
        elEdit[Apellido].Text,elEdit[Apellido]);
 Campos[Edad]:=TDatoEntero.Crea('Edad: ',
        elEdit[Edad],16,80,' años ');
 Campos[Peso]:=TDatoSimple.Crea('Peso: ',
        elEdit[Peso],40,120,' Kg. ');
 Campos[Altura]:=TDatoDoble.Crea('Estatura: ',
        elEdit[Altura],120,200,' cm. ');
end;

function TAlumno.MostrarDatos: boolean;
var i: NombreCampos; Saludo, Mensaje: string;
begin
  Result:=true;
  Saludo:='Hola ';  Mensaje:='Datos Validados: ';
  for i:=Nombre to Altura do
    if not (Campos[i].Asignado) then
    begin
      MessageDlg('Entre o corrija su '+
          Campos[i].NombreDato,mtError,[mbOK],0);
    if Campos[i] is TDatoCuantitativo then
    with TDatoCuantitativo(Campos[i]) do
 MessageDlg('Rango válido: '+ 
 FloatToStr(LimiteInferior)+', '+
 FloatToStr(LimiteSuperior),mtInformation,[mbOK],0);
      Result:=false;
    end else
    begin
      if Campos[i] is TDatoCuantitativo then
    with TDatoCuantitativo(Campos[i]) do
    Mensaje:=Mensaje+NombreDato+Dato+Unidad+' '
    else Saludo:=Saludo+' ' + Campos[i].Dato;
    end;
  ShowMessage(Saludo);  ShowMessage(Mensaje);
end;
end.
