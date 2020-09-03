<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="Default.aspx.cs" Inherits="WebRegiones._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Regiones</h1>
        
    </div>

    <div class="row">

        <div class="col-md-12">

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
                        <label  style="font-size:20px;" for="">Municipio</label>
                    </div>
                    <div class="col-sm-4">
                         <asp:DropDownList ID="ddlMunicipio" class="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label Font-Size="16" Font-Bold="true" ID="Label2" runat="server"></asp:Label>
                    </div>
                </div>
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
                        <asp:Button ID="btnActualizar" class="btn btn-success" runat="server" OnClick="Actualizar_Click" Text="Actualizar" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-2">
                        <br />
                        <asp:Button ID="btnConsultar" class="btn btn-primary" runat="server" OnClick="btnConsultar_Click" Text="Consultar" Width="137px" />
                    </div>
                    <div class="col-sm-10">
                        <br />
                        <asp:GridView ID="gvdRegiones" CssClass="table table-condensed table-hover" runat="server" HorizontalAlign="Center" Font-Bold="True" Font-Size="Medium" Width="500px">
                        </asp:GridView>
                    </div>
                    <div class="col-sm">
                    </div>
                </div>
            </div>




          
        </div>
    </div>

</asp:Content>
