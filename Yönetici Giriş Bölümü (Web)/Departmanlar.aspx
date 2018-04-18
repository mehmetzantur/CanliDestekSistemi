﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Departmanlar.aspx.cs" Inherits="Departmanlar" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.5.0, Culture=neutral, PublicKeyToken=940cfcde86f32efd" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
    
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" KeyFieldName="DEPID" 
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
            Font-Names="Calibri" Width="250px">
            <Columns>
                <dx:GridViewCommandColumn AllowDragDrop="Default" ButtonType="Link" 
                    FixedStyle="None" VisibleIndex="0" Caption="İşlem" 
                    ShowInCustomizationForm="True" Width="100px">
                    <EditButton Text="Düzenle" Visible="True">
                        <Image Align="NotSet">
                        </Image>
                    </EditButton>
                    <NewButton Visible="True" Text="Yeni">
                        <Image Align="NotSet">
                        </Image>
                    </NewButton>
                    <DeleteButton Text="Sil" Visible="True">
                        <Image Align="NotSet">
                        </Image>
                    </DeleteButton>
                    <SelectButton>
                        <Image Align="NotSet">
                        </Image>
                    </SelectButton>
                    <CancelButton Text="İptal">
                        <Image Align="NotSet">
                        </Image>
                    </CancelButton>
                    <UpdateButton Text="Güncelle">
                        <Image Align="NotSet">
                        </Image>
                    </UpdateButton>
                    <ClearFilterButton>
                        <Image Align="NotSet">
                        </Image>
                    </ClearFilterButton>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="NotSet" Wrap="Default">
                    <BackgroundImage Repeat="Repeat" />
                    <Border BorderStyle="NotSet" />
                    </HeaderStyle>
                    <CellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </FooterCellStyle>
                    <GroupFooterCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" 
                        Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </GroupFooterCellStyle>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="DEPADI" FixedStyle="None" 
                    SortOrder="None" UnboundType="Bound" VisibleIndex="1" 
                    ShowInCustomizationForm="True" Width="150px" Caption="Departman">
                    <PropertiesTextEdit>
                        <MaskSettings IncludeLiterals="All" />
                        <MaskHintStyle Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </MaskHintStyle>
                        <NullTextStyle HorizontalAlign="NotSet" Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </NullTextStyle>
                        <ReadOnlyStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </ReadOnlyStyle>
                        <FocusedStyle HorizontalAlign="NotSet" Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </FocusedStyle>
                        <InvalidStyle HorizontalAlign="NotSet" Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </InvalidStyle>
                        <ValidationSettings Display="Static" ErrorDisplayMode="ImageWithTooltip" 
                            ErrorTextPosition="Right">
                            <ErrorImage Align="NotSet">
                            </ErrorImage>
                            <ErrorFrameStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                                <HoverStyle>
                                    <BackgroundImage Repeat="Repeat" />
                                    <Border BorderStyle="NotSet" />
                                    <BorderLeft BorderStyle="NotSet" />
                                    <BorderTop BorderStyle="NotSet" />
                                    <BorderRight BorderStyle="NotSet" />
                                    <BorderBottom BorderStyle="NotSet" />
                                </HoverStyle>
                                <BackgroundImage Repeat="Repeat" />
                                <Border BorderStyle="NotSet" />
                                <BorderLeft BorderStyle="NotSet" />
                                <BorderTop BorderStyle="NotSet" />
                                <BorderRight BorderStyle="NotSet" />
                                <BorderBottom BorderStyle="NotSet" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                        <Style HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </Style>
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="Default" AllowAutoFilterTextInputTimer="Default" 
                        AllowDragDrop="Default" AllowGroup="Default" AllowHeaderFilter="Default" 
                        AllowSort="Default" AutoFilterCondition="Default" FilterMode="Value" 
                        GroupInterval="Default" ShowFilterRowMenu="Default" 
                        ShowInFilterControl="Default" SortMode="Default" />
                    <EditFormSettings CaptionLocation="Default" Visible="Default" />
                    <EditCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </EditCellStyle>
                    <FilterCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </FilterCellStyle>
                    <EditFormCaptionStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" 
                        Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </EditFormCaptionStyle>
                    <HeaderStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                    <BackgroundImage Repeat="Repeat" />
                    <Border BorderStyle="NotSet" />
                    </HeaderStyle>
                    <CellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </FooterCellStyle>
                    <GroupFooterCellStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" 
                        Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </GroupFooterCellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
<SettingsBehavior ColumnResizeMode="Disabled" SortMode="Default"></SettingsBehavior>

<SettingsPager Mode="ShowPager" Position="Bottom" SEOFriendly="Disabled" EllipsisMode="InsideNumeric" RenderMode="Classic">
<AllButton>
<Image Align="NotSet"></Image>
</AllButton>

<FirstPageButton>
<Image Align="NotSet"></Image>
</FirstPageButton>

<LastPageButton>
<Image Align="NotSet"></Image>
</LastPageButton>

<NextPageButton>
<Image Align="NotSet"></Image>
</NextPageButton>

<PrevPageButton>
<Image Align="NotSet"></Image>
</PrevPageButton>
</SettingsPager>

<SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Top" 
                PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" 
                PopupEditFormModal="True"></SettingsEditing>

<Settings ShowGroupFooter="Hidden" VerticalScrollBarStyle="Standard" ShowStatusBar="Auto" ShowFilterBar="Hidden" GridLines="Both"></Settings>

            <SettingsText PopupEditFormCaption="Düzenle/Yeni Ekle" />

<SettingsCustomizationWindow PopupHorizontalAlign="WindowCenter" 
                PopupVerticalAlign="WindowCenter"></SettingsCustomizationWindow>

<SettingsLoadingPanel Mode="ShowAsPopup" ImagePosition="Top"></SettingsLoadingPanel>

<SettingsDetail ExportMode="None"></SettingsDetail>

<Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
<LoadingPanelOnStatusBar Align="NotSet" 
        Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif"></LoadingPanelOnStatusBar>

<CollapsedButton Align="NotSet"></CollapsedButton>

<ExpandedButton Align="NotSet"></ExpandedButton>

<DetailCollapsedButton Align="NotSet"></DetailCollapsedButton>

<DetailExpandedButton Align="NotSet"></DetailExpandedButton>

<HeaderFilter Align="NotSet"></HeaderFilter>

<HeaderActiveFilter Align="NotSet"></HeaderActiveFilter>

<HeaderSortDown Align="NotSet"></HeaderSortDown>

<HeaderSortUp Align="NotSet"></HeaderSortUp>

<DragAndDropArrowDown Align="NotSet"></DragAndDropArrowDown>

<DragAndDropArrowUp Align="NotSet"></DragAndDropArrowUp>

<DragAndDropColumnHide Align="NotSet"></DragAndDropColumnHide>

<ParentGroupRows Align="NotSet"></ParentGroupRows>

<FilterRowButton Align="NotSet"></FilterRowButton>

<CustomizationWindowClose Align="NotSet"></CustomizationWindowClose>

<PopupEditFormWindowClose Align="NotSet"></PopupEditFormWindowClose>

<WindowResizer Align="NotSet"></WindowResizer>

<FilterBuilderClose Align="NotSet"></FilterBuilderClose>

<LoadingPanel Align="NotSet" Url="~/App_Themes/Aqua/GridView/Loading.gif"></LoadingPanel>
</Images>

<ImagesEditors>
<CalendarPrevYear Align="NotSet"></CalendarPrevYear>

<CalendarPrevMonth Align="NotSet"></CalendarPrevMonth>

<CalendarNextMonth Align="NotSet"></CalendarNextMonth>

<CalendarNextYear Align="NotSet"></CalendarNextYear>

<CalendarFastNavPrevYear Align="NotSet"></CalendarFastNavPrevYear>

<CalendarFastNavNextYear Align="NotSet"></CalendarFastNavNextYear>

<CheckBoxChecked Align="NotSet"></CheckBoxChecked>

<CheckBoxUnchecked Align="NotSet"></CheckBoxUnchecked>

<CheckBoxUndefined Align="NotSet"></CheckBoxUndefined>

<RadioButtonChecked Align="NotSet"></RadioButtonChecked>

<RadioButtonUnchecked Align="NotSet"></RadioButtonUnchecked>

<RadioButtonUndefined Align="NotSet"></RadioButtonUndefined>

<ButtonEditEllipsis Align="NotSet"></ButtonEditEllipsis>

<DropDownEditDropDown Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
        PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
    </DropDownEditDropDown>

<ImageEmpty Align="NotSet"></ImageEmpty>

<ListEditItem Align="NotSet"></ListEditItem>

<SpinEditIncrement Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua" 
        PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
    </SpinEditIncrement>

<SpinEditDecrement Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua" 
        PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
    </SpinEditDecrement>

<SpinEditLargeIncrement Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua" 
        PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
    </SpinEditLargeIncrement>

<SpinEditLargeDecrement Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua" 
        PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
    </SpinEditLargeDecrement>

<LoadingPanel Align="NotSet"></LoadingPanel>
</ImagesEditors>

<ImagesFilterControl>
<AddButton Align="NotSet"></AddButton>

<AddButtonHot Align="NotSet"></AddButtonHot>

<RemoveButton Align="NotSet"></RemoveButton>

<RemoveButtonHot Align="NotSet"></RemoveButtonHot>

<AddCondition Align="NotSet"></AddCondition>

<AddGroup Align="NotSet"></AddGroup>

<RemoveGroup Align="NotSet"></RemoveGroup>

<GroupTypeAnd Align="NotSet"></GroupTypeAnd>

<GroupTypeOr Align="NotSet"></GroupTypeOr>

<GroupTypeNotAnd Align="NotSet"></GroupTypeNotAnd>

<GroupTypeNotOr Align="NotSet"></GroupTypeNotOr>

<OperationAnyOf Align="NotSet"></OperationAnyOf>

<OperationBeginsWith Align="NotSet"></OperationBeginsWith>

<OperationBetween Align="NotSet"></OperationBetween>

<OperationContains Align="NotSet"></OperationContains>

<OperationDoesNotContain Align="NotSet"></OperationDoesNotContain>

<OperationDoesNotEqual Align="NotSet"></OperationDoesNotEqual>

<OperationEndsWith Align="NotSet"></OperationEndsWith>

<OperationEquals Align="NotSet"></OperationEquals>

<OperationGreater Align="NotSet"></OperationGreater>

<OperationGreaterOrEqual Align="NotSet"></OperationGreaterOrEqual>

<OperationIsNotNull Align="NotSet"></OperationIsNotNull>

<OperationIsNull Align="NotSet"></OperationIsNull>

<OperationLess Align="NotSet"></OperationLess>

<OperationLessOrEqual Align="NotSet"></OperationLessOrEqual>

<OperationLike Align="NotSet"></OperationLike>

<OperationNoneOf Align="NotSet"></OperationNoneOf>

<OperationNotBetween Align="NotSet"></OperationNotBetween>

<OperationNotLike Align="NotSet"></OperationNotLike>

<LoadingPanel Align="NotSet" Url="~/App_Themes/Aqua/Editors/Loading.gif"></LoadingPanel>
</ImagesFilterControl>

<Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
<Disabled>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Disabled>

<Customization HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Customization>

<PopupEditForm HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PopupEditForm>

<Table HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Table>

<Header HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>
</Header>

<GroupRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</GroupRow>

<FocusedGroupRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</FocusedGroupRow>

<Row HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</Row>

<RowHotTrack HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</RowHotTrack>

<DetailRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</DetailRow>

<DetailCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DetailCell>

<PreviewRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</PreviewRow>

<EmptyDataRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</EmptyDataRow>

<AlternatingRow Enabled="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</AlternatingRow>

<SelectedRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</SelectedRow>

<FocusedRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</FocusedRow>

<FilterRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</FilterRow>

<Cell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Cell>

<Footer HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Footer>

<GroupFooter HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</GroupFooter>

<GroupPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</GroupPanel>

<HeaderPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HeaderPanel>

<PagerTopPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PagerTopPanel>

<PagerBottomPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PagerBottomPanel>

<DetailButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DetailButton>

<CustomizationWindow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CustomizationWindow>

<CustomizationWindowCloseButton Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CustomizationWindowCloseButton>

<CustomizationWindowContent HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CustomizationWindowContent>

<CustomizationWindowHeader HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CustomizationWindowHeader>

<PopupEditFormWindow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PopupEditFormWindow>

<PopupEditFormWindowCloseButton Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PopupEditFormWindowCloseButton>

<PopupEditFormWindowContent HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PopupEditFormWindowContent>

<PopupEditFormWindowHeader HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PopupEditFormWindowHeader>

<FilterBuilderCloseButton Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBuilderCloseButton>

<FilterBuilderHeader HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBuilderHeader>

<FilterBuilderMainArea HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBuilderMainArea>

<FilterBuilderButtonArea HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBuilderButtonArea>

<LoadingPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default" 
        ImageSpacing="8px">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LoadingPanel>

<LoadingDiv>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LoadingDiv>

<CommandColumn HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CommandColumn>

<CommandColumnItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CommandColumnItem>

<InlineEditCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</InlineEditCell>

<FilterCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterCell>

<InlineEditRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</InlineEditRow>

<EditFormDisplayRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</EditFormDisplayRow>

<EditingErrorRow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>
</EditingErrorRow>

<EditForm HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</EditForm>

<EditFormCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</EditFormCell>

<EditFormTable HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</EditFormTable>

<EditFormColumnCaption HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</EditFormColumnCaption>

<TitlePanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</TitlePanel>

<StatusBar HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</StatusBar>

<FilterBar HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBar>

<FilterBarLink HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBarLink>

<FilterBarCheckBoxCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBarCheckBoxCell>

<FilterBarImageCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBarImageCell>

<FilterBarExpressionCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBarExpressionCell>

<FilterBarClearButtonCell HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterBarClearButtonCell>

<FilterPopupWindow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupWindow>

<FilterPopupItemsArea HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupItemsArea>

<FilterPopupButtonPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupButtonPanel>

<FilterPopupItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupItem>

<FilterPopupActiveItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupActiveItem>

<FilterPopupSelectedItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterPopupSelectedItem>

<FilterRowMenu HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<GutterBackgroundImage Repeat="Repeat"></GutterBackgroundImage>

<SeparatorBackgroundImage Repeat="Repeat"></SeparatorBackgroundImage>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterRowMenu>

<FilterRowMenuItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DropDownButtonStyle>
<CheckedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CheckedStyle>

<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DropDownButtonStyle>

<CheckedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CheckedStyle>

<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FilterRowMenuItem>
</Styles>

<StylesPager>
<Button HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Button>

<DisabledButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledButton>

<CurrentPageNumber HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CurrentPageNumber>

<PageNumber HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PageNumber>

<Summary HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Summary>

<Ellipsis HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Ellipsis>
</StylesPager>

<StylesEditors>
<Style HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Style>

<ReadOnlyStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ReadOnlyStyle>

<ReadOnly HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ReadOnly>

<CheckEdit HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CheckEdit>

<ListBox HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ListBox>

<ListBoxItem HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ListBoxItem>

<RadioButtonList HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</RadioButtonList>

<IncrementButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</IncrementButtonStyle>

<SpinEditIncrementButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SpinEditIncrementButton>

<DecrementButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DecrementButtonStyle>

<SpinEditDecrementButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SpinEditDecrementButton>

<LargeIncrementButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LargeIncrementButtonStyle>

<SpinEditLargeIncrementButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SpinEditLargeIncrementButton>

<LargeDecrementButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LargeDecrementButtonStyle>

<SpinEditLargeDecrementButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SpinEditLargeDecrementButton>

<Label HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Label>

<Hyperlink HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Hyperlink>

<Image HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Image>

<Memo HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Memo>

<TextBox HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</TextBox>

<ButtonEdit HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ButtonEdit>

<ButtonEditButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ButtonEditButton>

<Calendar HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Calendar>

<CalendarDayHeader Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDayHeader>

<CalendarWeekNumber Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarWeekNumber>

<CalendarDay Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDay>

<CalendarDayOtherMonth Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDayOtherMonth>

<CalendarDaySelected Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDaySelected>

<CalendarDayWeekEnd Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDayWeekEnd>

<CalendarDayOutOfRange Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarDayOutOfRange>

<CalendarToday Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarToday>

<CalendarHeader HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default" 
        Spacing="1px">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarHeader>

<CalendarFooter HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFooter>

<CalendarButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarButton>

<CalendarFastNav Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNav>

<CalendarFastNavMonthArea Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNavMonthArea>

<CalendarFastNavYearArea Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNavYearArea>

<CalendarFastNavMonth Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNavMonth>

<CalendarFastNavYear Wrap="Default" HorizontalAlign="NotSet" VerticalAlign="NotSet">
<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNavYear>

<CalendarFastNavFooter HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</CalendarFastNavFooter>

<MaskHint Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</MaskHint>

<ProgressBar HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default" 
        Height="25px">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ProgressBar>

<ProgressBarIndicator>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ProgressBarIndicator>

<DropDownWindow HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DropDownWindow>

<ColorTable>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ColorTable>

<ColorTableCell>
<ColorBorder BorderStyle="NotSet"></ColorBorder>

<ColorBorderLeft BorderStyle="NotSet"></ColorBorderLeft>

<ColorBorderTop BorderStyle="NotSet"></ColorBorderTop>

<ColorBorderRight BorderStyle="NotSet"></ColorBorderRight>

<ColorBorderBottom BorderStyle="NotSet"></ColorBorderBottom>

<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ColorTableCell>

<ColorIndicator>
<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ColorIndicator>

<DisplayColorIndicator>
<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisplayColorIndicator>

<Focused HorizontalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Focused>

<NullText HorizontalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</NullText>

<Invalid HorizontalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Invalid>

<LoadingPanel HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LoadingPanel>

<LoadingDiv>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LoadingDiv>
</StylesEditors>

<StylesFilterControl>
<Table HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Table>

<PropertyName HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PropertyName>

<GroupType HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</GroupType>

<Operation HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Operation>

<Value HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</Value>

<ImageButton HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ImageButton>
</StylesFilterControl>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
        </dx:ASPxGridView>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:onlineDBConnectionString %>" 
        InsertCommand="insert into devonline.DEPARTMAN (DEPADI) values(@DEPADI)" 
        SelectCommand="select * from devonline.DEPARTMAN" 
        DeleteCommand="delete from devonline.DEPARTMAN where DEPID=@DEPID" 
        UpdateCommand="update devonline.DEPARTMAN set DEPADI=@DEPADI where DEPID=@DEPID">
         <DeleteParameters>
             <asp:Parameter Name="DEPID" />
         </DeleteParameters>
         <InsertParameters>
            <asp:Parameter Name="DEPADI" />
        </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="DEPADI" />
             <asp:Parameter Name="DEPID" />
         </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
