<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Municipios.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="WebRegiones.Municipios" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<body>
    
   <div class="jumbotron">
        <h1>Municipios</h1>
        <p class="lead">&nbsp;</p>
        
    </div>

    <div class="row">
       
        <div class="col-md-12">
            
            &nbsp;

            <div class="container">
                <div class="row form-group">
                    <div class="col-sm-4">
                        <label  style="font-size:20px;" for="">Nombre</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" id="txtName" runat="server" value="" />
                    </div>
                    <div class="col-sm-4">
                        <asp:Label Font-Size="16" Font-Bold="true" ID="lblMensaje" runat="server"></asp:Label>
                    </div>
                </div>

                 <div class="row form-group">
                    <div class="col-sm-4">
                        <label  style="font-size:20px;" for="">Estado</label>
                    </div>
                    <div class="col-sm-4" style="margin-top: 5px;">
                        <asp:CheckBox ID="cbxEstado" class="form-check-input"  HorizontalAlign="Center" runat="server"></asp:CheckBox>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label Font-Size="16" Font-Bold="true" ID="Label1" runat="server"></asp:Label>
                    </div>
                </div>
                <%-- <div class="row form-group">
                    <div class="col-sm-4">
                        <label  style="font-size:20px;" for="">Region</label>
                    </div>
                    <div class="col-sm-4">
                         <asp:DropDownList ID="ddlRegiones" class="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label Font-Size="16" Font-Bold="true" ID="Label2" runat="server"></asp:Label>
                    </div>
                </div>--%>
                <div class="row">
                    <div class="col-sm-4">
                        <label style="font-size:20px;" for="">Codigo</label>
                    </div>
                    <div class="col-sm-4">
                        <input type="text" name="name" class="form-control" id="txtcodigo" runat="server" value="" />

                    </div>
                    <div class="col-sm-4">
                        <asp:RegularExpressionValidator ID="revtxtcodigo" ControlToValidate="txtcodigo" runat="server" ValidationExpression="\d+" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <br />
                        <asp:Button class="btn btn-danger" OnClick="Eliminar_Click" runat="server" Text="Eliminar"></asp:Button>
                    </div>
                    <div class="col-sm-4">
                        <br />
                        <asp:Button ID="btnAgregar" class="btn btn-success" runat="server" OnClick="Registrar_Click" Text="Agregar" />
                    </div>
                    <div class="col-sm-4">
                        <br />
                        <asp:Button ID="btnActualizar" class="btn btn-success" runat="server" OnClick="btnActualizar_Click" Text="Actualizar" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <br />
                        <asp:Button ID="btnConsultar" class="btn btn-primary" runat="server" OnClick="btnConsultar_Click" Text="Consultar" Width="137px" />
                    </div>
                    <div class="col-sm-10">
                        <br />
                        <asp:GridView ID="gvdMunicipios" CssClass="table table-condensed table-hover" runat="server"  HorizontalAlign="Center" Font-Bold="True" Font-Size="Medium" Width="500px">
                        </asp:GridView>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>
            <%--<asp:Table ID="Crud" runat="server" Height="69px" Width="872px">
                <asp:TableRow runat="server">
                 <asp:TableCell>
                  Region
                 </asp:TableCell>
                 <asp:TableCell>
                     <asp:DropDownList ID="ddlRegiones" class="form-control" runat="server"></asp:DropDownList>
                 </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
               Nombre
            </asp:TableCell>
            <asp:TableCell>
               <input type="text" class="form-control" name="name" ID="txtName" runat="server" value="" /> 
            </asp:TableCell>
                </asp:TableRow>
               
                 <asp:TableRow runat="server">
                     
                  
                  <asp:TableCell>    
                      Estado<asp:CheckBox ID="cbxEstado" class="checkbox" runat="server"></asp:CheckBox>
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
               <input type="text"  class="form-control" name="name" ID="txtcodigo" runat="server" value="" /> 
               <asp:RegularExpressionValidator ID="revtxtcodigo" ControlToValidate="txtcodigo" runat="server" ValidationExpression="\d+" ErrorMessage="Solo numeros"></asp:RegularExpressionValidator>

                 </asp:TableCell>
             <asp:TableCell>
                <p> <asp:Button ID="btnActualizar" class="btn btn-success" runat="server" OnClick="Registrar_Click" Text="Actualizar"/> &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEliminar" class="btn btn-danger" runat="server" OnClick="Eliminar_Click" Text="Eliminar"/></p>
            </asp:TableCell>
            
                </asp:TableRow>
            </asp:Table>
&nbsp;<p> 
                <asp:Label Font-Size="16" Font-Bold="true" ID="lblMensaje" runat="server"></asp:Label>
            </p>
           
            <p>
                
                
                <asp:Button ID="btnConsultar" class="btn btn-primary" runat="server" OnClick="btnConsultar_Click" Text="Consultar" Width="137px" />
            </p>
            <asp:GridView ID="gvdMunicipios" CssClass="table table-condensed table-hover" runat="server"  HorizontalAlign="Center" Font-Bold="True" Font-Size="Medium" Width="500px">
            </asp:GridView>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>--%>
            &nbsp;&nbsp;&nbsp;
        </div>
    
       
</body>
</asp:Content>
