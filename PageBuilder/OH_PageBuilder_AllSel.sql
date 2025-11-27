/*<info serverAlias="DBOH-ONEHub" executers="wsv_oh" isFunction="0" isNested="0"></info>*/
CREATE PROCEDURE [dbo].[OH_PageBuilder_AllSel]
	@IsPreview BIT = 0 -- 0: Main table, 1: Preview table
AS
/*
	Created: 20250913@Sophia
	DB: DBOH-ONEHub
	Task: Select All Landing Page builder and details data
	Revisions:
		- 20250913@Sophia: Initial version [RedmineID: #236797]
*/
BEGIN
	SET NOCOUNT ON;

	IF @IsPreview = 1
	BEGIN
		SELECT
			b.PageId,
			b.PageName,
			b.PageCode,
			b.CampaignId,
			b.TargetCountryCode,
			b.MarketId,
			ISNULL(m.TargetLanguageCode, mk.ShortedCode) AS TargetLanguageCode,
			b.StatusId,
			b.Creator,
			b.CreatedDate,
			b.UpdatedBy,
			b.UpdatedDate,
			b.RowVer,
			COALESCE(tp.ExchangeId, e.ExchangeId) AS CurrencyId,
			CAST(1 AS BIT) AS IsPreview
		FROM dbo.PageBuilder_Preview b WITH (NOLOCK)
		INNER JOIN dbo.TargetCountry t WITH (NOLOCK) 
			ON t.CountryCode = b.TargetCountryCode AND t.MarketID = b.MarketId
		INNER JOIN dbo.Market mk WITH (NOLOCK)
			ON mk.MarketId = b.MarketId
		LEFT JOIN dbo.OH_f_GetTargetLanguageCode() m
			ON mk.ShortedCode = m.ShortedCode
		LEFT JOIN dbo.TPExchange tp WITH (NOLOCK)
			ON tp.CountryCode = b.TargetCountryCode
		LEFT JOIN dbo.Exchange e WITH (NOLOCK)
			ON e.CountryCode = b.TargetCountryCode
		ORDER BY b.PageId DESC;



		SELECT
			d.PageId,
			d.OrderId,
			d.ModuleId,
			d.MediaId,
			d.ExtraInfo,
			mg.FileName,
			mg.MediaName,
			mg.Dimension,
			mg.MediaCode,
			m.ModuleType,
			m.NavigateTo,
			m.IsRequired,
			m.IsUnique,
			mg.RowVer
		FROM dbo.PageBuilderDetail_Preview d WITH (NOLOCK)
		LEFT JOIN dbo.MediaGallery mg WITH (NOLOCK)
			ON d.MediaId = mg.MediaId
		LEFT JOIN dbo.Module m WITH (NOLOCK)
			ON d.ModuleId = m.ModuleId
		ORDER BY d.PageId DESC, d.OrderId ASC;
	END
	ELSE
	BEGIN
		SELECT
			b.PageId,
			b.PageName,
			b.PageCode,
			b.CampaignId,
			b.TargetCountryCode,
			b.MarketId,
			ISNULL(m.TargetLanguageCode, mk.ShortedCode) AS TargetLanguageCode,
			b.StatusId,
			b.Creator,
			b.CreatedDate,
			b.UpdatedBy,
			b.UpdatedDate,
			b.RowVer,
			COALESCE(tp.ExchangeId, e.ExchangeId) AS CurrencyId,
			CAST(0 AS BIT) AS IsPreview
		FROM dbo.PageBuilder b WITH (NOLOCK)
		INNER JOIN dbo.TargetCountry t WITH (NOLOCK) 
			ON t.CountryCode = b.TargetCountryCode AND t.MarketID = b.MarketId
		INNER JOIN dbo.Market mk WITH (NOLOCK)
			ON mk.MarketId = b.MarketId
		LEFT JOIN dbo.OH_f_GetTargetLanguageCode() m
			ON mk.ShortedCode = m.ShortedCode
		LEFT JOIN dbo.TPExchange tp WITH (NOLOCK)
			ON tp.CountryCode = b.TargetCountryCode
		LEFT JOIN dbo.Exchange e WITH (NOLOCK)
			ON e.CountryCode = b.TargetCountryCode
		ORDER BY b.PageId DESC;

		SELECT
			d.PageId,
			d.OrderId,
			d.ModuleId,
			d.MediaId,
			d.ExtraInfo,
			mg.FileName,
			mg.MediaName,
			mg.Dimension,
			mg.MediaCode,
			m.ModuleType,
			m.NavigateTo,
			m.IsRequired,
			m.IsUnique,
			mg.RowVer
		FROM dbo.PageBuilderDetail d WITH (NOLOCK)
		LEFT JOIN dbo.MediaGallery mg WITH (NOLOCK)
			ON d.MediaId = mg.MediaId
		LEFT JOIN dbo.Module m WITH (NOLOCK)
			ON d.ModuleId = m.ModuleId
		ORDER BY d.PageId DESC, d.OrderId ASC;
	END
END;
