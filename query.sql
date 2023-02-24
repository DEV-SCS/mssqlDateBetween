CREATE Function [dbo].[Fn_aratarihler](@tarih1 date,@tarih2 date)
Returns nvarchar(MAX)
As
Begin
	DECLARE @tarihler nvarchar(MAX)= '';

	SET @tarih1 = DATEADD(day,1,@tarih1);
	WHILE @tarih1 < @tarih2 
	BEGIN
		SET @tarihler+=(case when @tarihler='' then '' else ',' end)+concat(year(@tarih1) ,'-' ,month(@tarih1),'-', day(@tarih1))
		SET @tarih1 = DATEADD(day,1,@tarih1);
	END;


	return @tarihler
End


select dbo.Fn_aratarihler('01.01.2023','10.01.2023')
