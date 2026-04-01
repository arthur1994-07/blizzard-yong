package LargeMap_fla
{
    import flash.display.*;
    import ran.ui.core.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var mcPos:MovieClip;
        public var panelInfo:MovieClip;
        public var panelCfg:MovieClip;
        public var panelSearch:MovieClip;
        public var radioCfg:RadioButton;
        public var radioInfo:RadioButton;
        public var radioSearch:RadioButton;
        public var radioCfg_text:Label;
        public var radioInfo_text:Label;
        public var radioSearch_text:Label;
        public var btnMyMap:Button;
        public var btnPrev:Button;
        public var btnNext:Button;
        public var comboMapList:DropdownMenu;
        public var map:MMap;
        public var mcSecretMap:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_comboMapList_Scene1_upper_0();
            this.__setProp_btnPrev_Scene1_upper_0();
            this.__setProp_btnNext_Scene1_upper_0();
            this.__setProp_btnMyMap_Scene1_upper_0();
            return;
        }// end function

        function __setProp_comboMapList_Scene1_upper_0()
        {
            try
            {
                this.comboMapList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.comboMapList.autoSize = "none";
            this.comboMapList.dropdown = "DefaultScrollingList";
            this.comboMapList.enabled = true;
            this.comboMapList.focusable = false;
            this.comboMapList.groupName = "";
            this.comboMapList.itemRenderer = "DefaultListItemRenderer";
            this.comboMapList.menuDirection = "down";
            this.comboMapList.menuMargin = 1;
            this.comboMapList.inspectableMenuOffset = {top:0, right:0, bottom:0, left:0};
            this.comboMapList.inspectableMenuPadding = {top:0, right:0, bottom:0, left:0};
            this.comboMapList.menuRowCount = 16;
            this.comboMapList.menuRowsFixed = true;
            this.comboMapList.menuWidth = -1;
            this.comboMapList.menuWrapping = "normal";
            this.comboMapList.overlayAlign = "none";
            this.comboMapList.overlayImg = "";
            this.comboMapList.overlayPadding = {x:0, y:0};
            this.comboMapList.preventAutoSize = false;
            this.comboMapList.scrollBar = "DefaultScrollBar";
            this.comboMapList.inspectableThumbOffset = {top:0, bottom:0};
            this.comboMapList.visible = true;
            try
            {
                this.comboMapList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnPrev_Scene1_upper_0()
        {
            try
            {
                this.btnPrev["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnPrev.autoRepeat = false;
            this.btnPrev.autoSize = "none";
            this.btnPrev.enabled = true;
            this.btnPrev.focusable = false;
            this.btnPrev.groupName = "";
            this.btnPrev.label = "";
            this.btnPrev.overlayAlign = "none";
            this.btnPrev.overlayImg = "";
            this.btnPrev.overlayPadding = {x:0, y:0};
            this.btnPrev.preventAutoSize = false;
            this.btnPrev.selected = false;
            this.btnPrev.toggle = false;
            this.btnPrev.visible = true;
            try
            {
                this.btnPrev["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnNext_Scene1_upper_0()
        {
            try
            {
                this.btnNext["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnNext.autoRepeat = false;
            this.btnNext.autoSize = "none";
            this.btnNext.enabled = true;
            this.btnNext.focusable = false;
            this.btnNext.groupName = "";
            this.btnNext.label = "";
            this.btnNext.overlayAlign = "none";
            this.btnNext.overlayImg = "";
            this.btnNext.overlayPadding = {x:0, y:0};
            this.btnNext.preventAutoSize = false;
            this.btnNext.selected = false;
            this.btnNext.toggle = false;
            this.btnNext.visible = true;
            try
            {
                this.btnNext["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnMyMap_Scene1_upper_0()
        {
            try
            {
                this.btnMyMap["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnMyMap.autoRepeat = false;
            this.btnMyMap.autoSize = "none";
            this.btnMyMap.enabled = true;
            this.btnMyMap.focusable = false;
            this.btnMyMap.groupName = "";
            this.btnMyMap.label = "";
            this.btnMyMap.overlayAlign = "none";
            this.btnMyMap.overlayImg = "";
            this.btnMyMap.overlayPadding = {x:0, y:0};
            this.btnMyMap.preventAutoSize = false;
            this.btnMyMap.selected = false;
            this.btnMyMap.toggle = false;
            this.btnMyMap.visible = true;
            try
            {
                this.btnMyMap["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this.mcPos, true);
            return;
        }// end function

    }
}
