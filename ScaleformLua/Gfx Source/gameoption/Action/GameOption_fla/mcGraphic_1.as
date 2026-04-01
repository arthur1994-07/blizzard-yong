package GameOption_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class mcGraphic_1 extends MovieClip
    {
        public var comboDefault:DropdownMenu;
        public var comboResolution:DropdownMenu;
        public var comboShadow:DropdownMenu;
        public var comboDetail:DropdownMenu;
        public var comboSight:DropdownMenu;
        public var comboPhysical:DropdownMenu;
        public var comboTextureFilter:DropdownMenu;
        public var comboTextureRes:DropdownMenu;
        public var comboAntiAliasing:DropdownMenu;
        public var checkBuff:CheckBox;
        public var checkReflect:CheckBox;
        public var checkGlow:CheckBox;
        public var checkVSync:CheckBox;
        public var checkNormalmap:CheckBox;
        public var checkMapPoint:CheckBox;
        public var checkTerrainShadow:CheckBox;
        public var checkDistortion:CheckBox;
        public var checkPostProc:CheckBox;
        public var checkTargetEff:CheckBox;
        public var checkItemEff:CheckBox;
        public var checkSSAO:CheckBox;
        public var checkBuff_text:Label;
        public var checkReflect_text:Label;
        public var checkGlow_text:Label;
        public var checkVSync_text:Label;
        public var checkNormalmap_text:Label;
        public var checkMapPoint_text:Label;
        public var checkTerrainShadow_text:Label;
        public var checkDistortion_text:Label;
        public var checkPostProc_text:Label;
        public var checkTargetEff_text:Label;
        public var checkItemEff_text:Label;
        public var checkSSAO_text:Label;
        public var labelDefault:Label;
        public var labelResolution:Label;
        public var labelShadow:Label;
        public var labelDetail:Label;
        public var labelSight:Label;
        public var labelPhysical:Label;
        public var labelTextureFilter:Label;
        public var labelTextureRes:Label;
        public var labelAntiAliasing:Label;

        public function mcGraphic_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_comboDefault_mcGraphic_asset_0();
            this.__setProp_comboShadow_mcGraphic_asset_0();
            this.__setProp_comboDetail_mcGraphic_asset_0();
            this.__setProp_comboSight_mcGraphic_asset_0();
            this.__setProp_comboResolution_mcGraphic_asset_0();
            this.__setProp_comboPhysical_mcGraphic_asset_0();
            this.__setProp_comboTextureFilter_mcGraphic_asset_0();
            this.__setProp_comboTextureRes_mcGraphic_asset_0();
            this.__setProp_comboAntiAliasing_mcGraphic_asset_0();
            return;
        }// end function

        function __setProp_comboDefault_mcGraphic_asset_0()
        {
            try
            {
                this.comboDefault["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboDefault.autoSize = "none";
            this.comboDefault.dropdown = "DefaultScrollingList";
            this.comboDefault.enabled = true;
            this.comboDefault.focusable = false;
            this.comboDefault.groupName = "";
            this.comboDefault.itemRenderer = "DefaultListItemRenderer";
            this.comboDefault.menuDirection = "down";
            this.comboDefault.menuMargin = 1;
            this.comboDefault.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboDefault.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboDefault.menuRowCount = 5;
            this.comboDefault.menuRowsFixed = true;
            this.comboDefault.menuWidth = -1;
            this.comboDefault.menuWrapping = "normal";
            this.comboDefault.overlayAlign = "none";
            this.comboDefault.overlayImg = "";
            this.comboDefault.overlayPadding = {x:0, y:0};
            this.comboDefault.scrollBar = "DefaultScrollBar";
            this.comboDefault.inspectableThumbOffset = {top:0, bottom:0};
            this.comboDefault.visible = true;
            try
            {
                this.comboDefault["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboShadow_mcGraphic_asset_0()
        {
            try
            {
                this.comboShadow["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboShadow.autoSize = "none";
            this.comboShadow.dropdown = "DefaultScrollingList";
            this.comboShadow.enabled = true;
            this.comboShadow.focusable = false;
            this.comboShadow.groupName = "";
            this.comboShadow.itemRenderer = "DefaultListItemRenderer";
            this.comboShadow.menuDirection = "down";
            this.comboShadow.menuMargin = 1;
            this.comboShadow.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboShadow.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboShadow.menuRowCount = 5;
            this.comboShadow.menuRowsFixed = true;
            this.comboShadow.menuWidth = -1;
            this.comboShadow.menuWrapping = "normal";
            this.comboShadow.overlayAlign = "none";
            this.comboShadow.overlayImg = "";
            this.comboShadow.overlayPadding = {x:0, y:0};
            this.comboShadow.scrollBar = "DefaultScrollBar";
            this.comboShadow.inspectableThumbOffset = {top:0, bottom:0};
            this.comboShadow.visible = true;
            try
            {
                this.comboShadow["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboDetail_mcGraphic_asset_0()
        {
            try
            {
                this.comboDetail["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboDetail.autoSize = "none";
            this.comboDetail.dropdown = "DefaultScrollingList";
            this.comboDetail.enabled = true;
            this.comboDetail.focusable = false;
            this.comboDetail.groupName = "";
            this.comboDetail.itemRenderer = "DefaultListItemRenderer";
            this.comboDetail.menuDirection = "down";
            this.comboDetail.menuMargin = 1;
            this.comboDetail.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboDetail.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboDetail.menuRowCount = 5;
            this.comboDetail.menuRowsFixed = true;
            this.comboDetail.menuWidth = -1;
            this.comboDetail.menuWrapping = "normal";
            this.comboDetail.overlayAlign = "none";
            this.comboDetail.overlayImg = "";
            this.comboDetail.overlayPadding = {x:0, y:0};
            this.comboDetail.scrollBar = "DefaultScrollBar";
            this.comboDetail.inspectableThumbOffset = {top:0, bottom:0};
            this.comboDetail.visible = true;
            try
            {
                this.comboDetail["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboSight_mcGraphic_asset_0()
        {
            try
            {
                this.comboSight["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboSight.autoSize = "none";
            this.comboSight.dropdown = "DefaultScrollingList";
            this.comboSight.enabled = true;
            this.comboSight.focusable = false;
            this.comboSight.groupName = "";
            this.comboSight.itemRenderer = "DefaultListItemRenderer";
            this.comboSight.menuDirection = "down";
            this.comboSight.menuMargin = 1;
            this.comboSight.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboSight.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboSight.menuRowCount = 5;
            this.comboSight.menuRowsFixed = true;
            this.comboSight.menuWidth = -1;
            this.comboSight.menuWrapping = "normal";
            this.comboSight.overlayAlign = "none";
            this.comboSight.overlayImg = "";
            this.comboSight.overlayPadding = {x:0, y:0};
            this.comboSight.scrollBar = "DefaultScrollBar";
            this.comboSight.inspectableThumbOffset = {top:0, bottom:0};
            this.comboSight.visible = true;
            try
            {
                this.comboSight["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboResolution_mcGraphic_asset_0()
        {
            try
            {
                this.comboResolution["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboResolution.autoSize = "none";
            this.comboResolution.dropdown = "DefaultScrollingList";
            this.comboResolution.enabled = true;
            this.comboResolution.focusable = false;
            this.comboResolution.groupName = "";
            this.comboResolution.itemRenderer = "DefaultListItemRenderer";
            this.comboResolution.menuDirection = "down";
            this.comboResolution.menuMargin = 1;
            this.comboResolution.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboResolution.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboResolution.menuRowCount = 5;
            this.comboResolution.menuRowsFixed = true;
            this.comboResolution.menuWidth = -1;
            this.comboResolution.menuWrapping = "normal";
            this.comboResolution.overlayAlign = "none";
            this.comboResolution.overlayImg = "";
            this.comboResolution.overlayPadding = {x:0, y:0};
            this.comboResolution.scrollBar = "DefaultScrollBar";
            this.comboResolution.inspectableThumbOffset = {top:0, bottom:0};
            this.comboResolution.visible = true;
            try
            {
                this.comboResolution["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboPhysical_mcGraphic_asset_0()
        {
            try
            {
                this.comboPhysical["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboPhysical.autoSize = "none";
            this.comboPhysical.dropdown = "DefaultScrollingList";
            this.comboPhysical.enabled = true;
            this.comboPhysical.focusable = false;
            this.comboPhysical.groupName = "";
            this.comboPhysical.itemRenderer = "DefaultListItemRenderer";
            this.comboPhysical.menuDirection = "down";
            this.comboPhysical.menuMargin = 1;
            this.comboPhysical.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboPhysical.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboPhysical.menuRowCount = 5;
            this.comboPhysical.menuRowsFixed = true;
            this.comboPhysical.menuWidth = -1;
            this.comboPhysical.menuWrapping = "normal";
            this.comboPhysical.overlayAlign = "none";
            this.comboPhysical.overlayImg = "";
            this.comboPhysical.overlayPadding = {x:0, y:0};
            this.comboPhysical.scrollBar = "DefaultScrollBar";
            this.comboPhysical.inspectableThumbOffset = {top:0, bottom:0};
            this.comboPhysical.visible = true;
            try
            {
                this.comboPhysical["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboTextureFilter_mcGraphic_asset_0()
        {
            try
            {
                this.comboTextureFilter["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboTextureFilter.autoSize = "none";
            this.comboTextureFilter.dropdown = "DefaultScrollingList";
            this.comboTextureFilter.enabled = true;
            this.comboTextureFilter.focusable = false;
            this.comboTextureFilter.groupName = "";
            this.comboTextureFilter.itemRenderer = "DefaultListItemRenderer";
            this.comboTextureFilter.menuDirection = "down";
            this.comboTextureFilter.menuMargin = 1;
            this.comboTextureFilter.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboTextureFilter.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboTextureFilter.menuRowCount = 5;
            this.comboTextureFilter.menuRowsFixed = true;
            this.comboTextureFilter.menuWidth = -1;
            this.comboTextureFilter.menuWrapping = "normal";
            this.comboTextureFilter.overlayAlign = "none";
            this.comboTextureFilter.overlayImg = "";
            this.comboTextureFilter.overlayPadding = {x:0, y:0};
            this.comboTextureFilter.scrollBar = "DefaultScrollBar";
            this.comboTextureFilter.inspectableThumbOffset = {top:0, bottom:0};
            this.comboTextureFilter.visible = true;
            try
            {
                this.comboTextureFilter["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboTextureRes_mcGraphic_asset_0()
        {
            try
            {
                this.comboTextureRes["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboTextureRes.autoSize = "none";
            this.comboTextureRes.dropdown = "DefaultScrollingList";
            this.comboTextureRes.enabled = true;
            this.comboTextureRes.focusable = false;
            this.comboTextureRes.groupName = "";
            this.comboTextureRes.itemRenderer = "DefaultListItemRenderer";
            this.comboTextureRes.menuDirection = "down";
            this.comboTextureRes.menuMargin = 1;
            this.comboTextureRes.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboTextureRes.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboTextureRes.menuRowCount = 5;
            this.comboTextureRes.menuRowsFixed = true;
            this.comboTextureRes.menuWidth = -1;
            this.comboTextureRes.menuWrapping = "normal";
            this.comboTextureRes.overlayAlign = "none";
            this.comboTextureRes.overlayImg = "";
            this.comboTextureRes.overlayPadding = {x:0, y:0};
            this.comboTextureRes.scrollBar = "DefaultScrollBar";
            this.comboTextureRes.inspectableThumbOffset = {top:0, bottom:0};
            this.comboTextureRes.visible = true;
            try
            {
                this.comboTextureRes["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_comboAntiAliasing_mcGraphic_asset_0()
        {
            try
            {
                this.comboAntiAliasing["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboAntiAliasing.autoSize = "none";
            this.comboAntiAliasing.dropdown = "DefaultScrollingList";
            this.comboAntiAliasing.enabled = true;
            this.comboAntiAliasing.focusable = false;
            this.comboAntiAliasing.groupName = "";
            this.comboAntiAliasing.itemRenderer = "DefaultListItemRenderer";
            this.comboAntiAliasing.menuDirection = "down";
            this.comboAntiAliasing.menuMargin = 1;
            this.comboAntiAliasing.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboAntiAliasing.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboAntiAliasing.menuRowCount = 5;
            this.comboAntiAliasing.menuRowsFixed = true;
            this.comboAntiAliasing.menuWidth = -1;
            this.comboAntiAliasing.menuWrapping = "normal";
            this.comboAntiAliasing.overlayAlign = "none";
            this.comboAntiAliasing.overlayImg = "";
            this.comboAntiAliasing.overlayPadding = {x:0, y:0};
            this.comboAntiAliasing.scrollBar = "DefaultScrollBar";
            this.comboAntiAliasing.inspectableThumbOffset = {top:0, bottom:0};
            this.comboAntiAliasing.visible = true;
            try
            {
                this.comboAntiAliasing["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            return;
        }// end function

    }
}
