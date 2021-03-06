USE [RegionesDb]
GO
/****** Object:  Table [dbo].[RegionMunicipio]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegionMunicipio](
	[idRegion] [int] NULL,
	[idMunicipio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Municipio]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Municipio](
	[IdMunicipio] [int] IDENTITY(1,1) NOT NULL,
	[MunicipioName] [varchar](50) NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMunicipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Region]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Region](
	[IdRegion] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SPU_ActualizarMunicipio]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_ActualizarMunicipio] 
	-- Add the parameters for the stored procedure here
	@idMunicipio int,
	@Name varchar(50),
	@Estado bit,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	
	
	update m set m.estado=@Estado,MunicipioName =@Name from Tbl_Municipio m where IdMunicipio= @idMunicipio
	
	--update m set m.idmunicipio = null from RegionMunicipio m where m.idMunicipio= @idMunicipio
	DELETE FROM RegionMunicipio where idMunicipio = @idMunicipio
	
	SET @MENSAJE='EL MUNICIPIO SE ACTUALIZO CON EXITO';
    

	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_ActualizarRegion]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_ActualizarRegion] 
	-- Add the parameters for the stored procedure here
	@idRegion int,
	@Name varchar(50),
	@IdMunicipio int,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
    
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT 1 FROM tbl_Region WHERE RegionName = @NAME and IdRegion != @idRegion )
	BEGIN
	  SET @MENSAJE='LA REGION YA EXISTE CON ESE NOMBRE O INGRESASTE EL CODIGO O NOMBRE DE MANERA INCORRECTA';
	END
	ELSE
	Begin
    -- Insert statements for procedure here
	
	update R set RegionName =@Name    from   tbl_Region R where IdRegion= @idRegion
	IF(@IdMunicipio = 0)
	BEGIN
	update m set idMunicipio = NULL from regionmunicipio m where  @idRegion=idRegion
	END
	ELSE
	BEGIN
	update m set idMunicipio = @IdMunicipio from regionmunicipio m where @idRegion=idRegion

	END

	SET @MENSAJE='LA REGION SE ACTUALIZO CON EXITO';
    END

	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_ConsultaMunicipios]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_ConsultaMunicipios] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT m.IdMunicipio as 'Codigo',m.MunicipioName as 'Municipio' ,m.estado as 'Estado'  from tbl_Municipio m
	END
GO
/****** Object:  StoredProcedure [dbo].[SPU_ConsultarComboMunicipios]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_ConsultarComboMunicipios] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IdMunicipio as'Codigo' , MunicipioName as 'Municipio' from tbl_Municipio where estado != 0
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_ConsultaRegiones]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================  
-- Author:  <Author,,Name>  
-- Create date: <Create Date,,>  
-- Description: <Description,,>  
-- =============================================  
CREATE PROCEDURE [dbo].[SPU_ConsultaRegiones]   
 -- Add the parameters for the stored procedure here  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 SELECT r.IdRegion as ID, RegionName as Región ,ISNULL( m.MunicipioName,'') as 'Municipio' from tbl_Region r left join RegionMunicipio rm on r.IdRegion = rm.idregion left join tbl_Municipio m on m.IdMunicipio=rm.idMunicipio
END


GO
/****** Object:  StoredProcedure [dbo].[SPU_EliminarMunicipio]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_EliminarMunicipio] 
	-- Add the parameters for the stored procedure here
	@idMunicipio int,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF	EXISTS ( SELECT 1 FROM tbl_Municipio WHERE IdMunicipio= @idMunicipio)	
	BEGIN
	update m set idMunicipio = null from RegionMunicipio m where m.idMunicipio=@idMunicipio 
	DELETE FROM tbl_Municipio WHERE IdMunicipio= @idMunicipio
	SET @MENSAJE='EL MUNICIPIO SE ELIMINO CORRECTAMENTE';
	END 
	ELSE
    BEGIN
	-- Insert statements for procedure here
	SET @MENSAJE='EL CODIGO MUNICIPIO NO EXISTE';
	END
	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_EliminarRegion]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_EliminarRegion] 
	-- Add the parameters for the stored procedure here
	@idRegion int,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF	EXISTS ( SELECT 1 FROM tbl_Region WHERE IdRegion= @idRegion)	
	BEGIN
	DELETE FROM RegionMunicipio where idRegion=@idRegion
	DELETE FROM tbl_Region WHERE IdRegion= @idRegion
	SET @MENSAJE='LA REGION SE ELIMINO CORRECTAMENTE';
	END 
	ELSE
    BEGIN
	-- Insert statements for procedure here
	SET @MENSAJE='EL CODIGO DE REGION NO EXISTE';
	END
	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_InsertarMunicipio]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_InsertarMunicipio] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@Estado bit,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS( SELECT 1 FROM TBL_Municipio WHERE MunicipioName = @NAME  )
	BEGIN
	  SET @MENSAJE='EL MUNICIPIO YA EXISTE CON ESE NOMBRE';
	END
	else
	Begin
    -- Insert statements for procedure here
	INSERT INTO Tbl_Municipio (MunicipioName,estado) values(@Name,@Estado)
	SET @MENSAJE='EL MUNICIPIO SE GUARDO CON EXITO';
    END

	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SPU_InsertarRegion]    Script Date: 9/3/2020 5:41:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPU_InsertarRegion] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@IdMunicipio int,
	@MENSAJE VARCHAR(100) OUTPUT
AS
BEGIN
declare @IdRegion int
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @IdRegion =(select idregion from tbl_Region where RegionName=@Name)
	IF EXISTS(  SELECT 1 FROM TBL_REGION r inner join RegionMunicipio rm on rm.idRegion = r.IdRegion  WHERE rm.idMunicipio = @IdMunicipio and rm.idRegion=@IdRegion  )
	BEGIN

	  SET @MENSAJE='LA REGION CON ESE MUNICIPIO YA EXISTE';
	END
	ELSE
	IF EXISTS( SELECT 1 FROM TBL_REGION r inner join RegionMunicipio rm on rm.idRegion = r.IdRegion  WHERE r.RegionName=@Name  )

	BEGIN

	
	set @IdRegion =(SELECT IdRegion FROM TBL_REGION WHERE REGIONNAME = @NAME)
	INSERT INTO regionmunicipio (idregion,idMunicipio) values(@IdRegion,@IdMunicipio )

	SET @MENSAJE='EL MUNICIPIO SE GUARDO CON EXITO PARA LA REGION';
	end 
	else 
	begin
    -- Insert statements for procedure here
	INSERT INTO Tbl_Region (RegionName) values(@Name)

	
	set @IdRegion =(SELECT IdRegion FROM TBL_REGION WHERE REGIONNAME = @NAME)
	INSERT INTO regionmunicipio (idregion,idMunicipio) values(@IdRegion,@IdMunicipio )
	
	SET @MENSAJE='LA REGION SE GUARDO CON EXITO';
    END

	IF @@ERROR != 0
	BEGIN
	SET @MENSAJE = 'SE PRODUJO UN ERROR DURANTE EL PROCEDIMIENTO'
	END
END

GO
