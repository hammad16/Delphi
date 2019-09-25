//Class in "Delphi" that contains a method of connecting to a database to obtain user data and data insertion.

    unit registroclass; 
     s
    interface
     
    uses
      DM, DB;
     
    procedure UsuariosInfo (clave: Integer; sub: Integer);
    procedure insertCobro (cuenta: Integer; sriego: Smallint; scder:Double; ssder:Double; cuotacd:Currency; cuotasd:Currency; nom:String;ap:String);
     
    implementation 
     
    procedure UsuariosInfo (clave: Integer; sub: Integer);
    begin
    FDM.ZQUser.SQL.Text := 'Select * from productos where cuenta =:cu and subcuenta ' +
      '=:sub';
     FDM.ZQUser.ParamByName('cu').AsInteger :=clave;
     FDM.ZQUser.ParamByName('sub').AsInteger :=sub;
     
     
    end;
     
    procedure insertCobro (cuenta: Integer; sriego: Smallint; scder:Double; ssder:Double; cuotacd:Currency; cuotasd:Currency; nom:String;ap:String);
     
     
    begin
     
     FDM.ZQUser.SQL.Text := 'START TRANSACTION;Insert into pagosagua (idCuenta,nRiegos,supConDer,subSinDer,cuotaConDer,cuotaSinDer,nombre,apellido)'+
     'values(:cuen,:nriego,:scder,:ssder,:cuotacd,:cuotasd,:nom,:ap,:idu,:idc)' +
      '=:sub';
     FDM.ZQUser.SQL.Add('COMMIT');
     FDM.ZQUser.ParamByName('cuen').AsInteger :=cuenta;
     FDM.ZQUser.ParamByName('nrigeo').AsInteger :=sriego;
     FDM.ZQUser.ParamByName('scder').AsFloat :=scder;
     FDM.ZQUser.ParamByName('ssder').AsFloat :=ssder;
     FDM.ZQUser.ParamByName('cuotacd').AsCurrency :=cuotacd;
     FDM.ZQUser.ParamByName('cuotasd').AsCurrency :=cuotasd;
     FDM.ZQUser.ParamByName('nom').AsString :=nom;
     FDM.ZQUser.ParamByName('ap').AsString :=ap;
     
     
     
     
          try
            FDM.ZQUser.ExecSQL;
     
     
          except
     
            FDM.ZQUser.SQL.Text := 'ROLLBACK';
            FDM.ZQUser.ExecSQL;
     
     
          end;
     
     
     
     
    end;
     
     
     
    end.
