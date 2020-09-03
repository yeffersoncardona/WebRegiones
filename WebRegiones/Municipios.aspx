<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Municipios.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="WebRegiones.Municipios" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<body>
    
   <div class="jumbotron">
        <h1>Municipios</h1>
        <p class="lead">&nbsp;</p>
        
    </div>

    <div class="row">
       
        <div class="col-md-12">
            <p> Municipios</p>
            &nbsp;<asp:Table ID="Crud" runat="server" Height="69px" Width="872px">
                <asp:TableRow runat="server">
                 <asp:TableCell>
                  Region
                 </asp:TableCell>
                 <asp:TableCell>
                     <asp:DropDownList ID="ddlRegiones" runat="server"></asp:DropDownList>
                 </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
               Nombre
            </asp:TableCell>
            <asp:TableCell>
               <input type="text" name="name" ID="txtName" runat="server" value="" /> 
            </asp:TableCell>
                </asp:TableRow>
               
                 <asp:TableRow runat="server">
                     
                   <asp:TableCell>
                    Estado
                   </asp:TableCell>
                  <asp:TableCell>    
                      <asp:CheckBox ID="cbxEstado" runat="server"></asp:CheckBox>
                  </asp:TableCell>
                </asp:TableRow>
                        
                <asp:TableRow runat="server">
                    <asp:TableCell>
                 
            </asp:TableCell>
            <asp:TableCell>
                <p><asp:Button ID="btnAgregar" class="btn btn-success"  runat="server"  OnClick="Registrar_Click" Text="Agregar" /></p>
                
            </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow runat="server">
                    <asp:TableCell>
               Codigo
            </asp:TableCell>
            <asp:TableCell>
               <input type="text" name="name" ID="txtcodigo" runat="server" value="" /> 
                 </asp:TableCell>
             <asp:TableCell>
                <p> <asp:Button ID="btnActualizar" class="btn btn-success" runat="server" OnClick="Registrar_Click" Text="Actualizar"/> &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEliminar" class="btn btn-danger" runat="server" OnClick="Eliminar_Click" Text="Eliminar"/></p>
            </asp:TableCell>
            
                </asp:TableRow>
            </asp:Table>
&nbsp;<p> 
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </p>
           
            <p>
                
                
                <asp:Button ID="btnConsultar" class="btn btn-primary" runat="server" OnClick="btnConsultar_Click" Text="Consultar" Width="137px" />
            </p>
            <asp:GridView ID="gvdMunicipios" runat="server"  HorizontalAlign="Center" Font-Bold="True" Font-Size="Medium" Width="296px">
            </asp:GridView>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>
        </div>
    </div>
       
</body>
</asp:Content>
