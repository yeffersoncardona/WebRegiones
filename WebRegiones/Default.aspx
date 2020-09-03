<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Default.aspx.cs" Inherits="WebRegiones._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Regiones y Municipios</h1>
        <p class="lead">Regiones</p>
        
    </div>

    <div class="row">
       
        <div class="col-md-12">
            <p> Regiones</p>
            &nbsp;<asp:Table ID="Crud" runat="server" Height="69px" Width="872px">
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
               Codigo
            </asp:TableCell>
            <asp:TableCell>
               <input type="text" name="name" ID="txtcodigo" runat="server" value="" /> 
            </asp:TableCell>
            
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
                 <asp:Button class="btn btn-danger" OnClick="Eliminar_Click" runat="server" Text="Eliminar"></asp:Button>
            </asp:TableCell>
            <asp:TableCell>
                <p><asp:Button ID="btnAgregar" class="btn btn-success"  runat="server"  OnClick="Registrar_Click" Text="Agregar" /> &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnActualizar" class="btn btn-success"  runat="server"  OnClick="Actualizar_Click" Text="Actualizar" /></p>
            </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
&nbsp;<p> 
                <asp:Label ID="lblMensaje" runat="server"></asp:Label>
            </p>
           
            <p>
                
                
                <asp:Button ID="btnConsultar" class="btn btn-primary" runat="server" OnClick="btnConsultar_Click" Text="Consultar" Width="137px" />
            </p>
            <asp:GridView ID="gvdRegiones" runat="server"  HorizontalAlign="Center" Font-Bold="True" Font-Size="Medium" Width="296px">
            </asp:GridView>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>
            <p>
                
                &nbsp;</p>
        </div>
    </div>

</asp:Content>
