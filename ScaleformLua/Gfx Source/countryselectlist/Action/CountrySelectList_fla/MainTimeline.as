package CountrySelectList_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var listContinent:ScrollingList;
        public var listCountry:ScrollingList;
        public var labelContinent:Label;
        public var labelCountry:Label;
        public var btnOK:Button;
        public var btnCancel:Button;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_listContinent_Scene1_Layer2_0();
            this.__setProp_listCountry_Scene1_Layer2_0();
            this.__setProp_btnOK_Scene1_Layer2_0();
            this.__setProp_btnCancel_Scene1_Layer2_0();
            this.__setProp_labelContinent_Scene1_Layer2_0();
            this.__setProp_labelCountry_Scene1_Layer2_0();
            return;
        }// end function

        function __setProp_listContinent_Scene1_Layer2_0()
        {
            try
            {
                this.listContinent["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listContinent.enabled = true;
            this.listContinent.focusable = false;
            this.listContinent.itemRendererName = "ListItemRenderer_h20";
            this.listContinent.itemRendererInstanceName = "";
            this.listContinent.margin = 0;
            this.listContinent.multiSelect = false;
            this.listContinent.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listContinent.rowHeight = 0;
            this.listContinent.scrollBar = "DefaultScrollBar";
            this.listContinent.treeButtonClassName = "";
            this.listContinent.treeButtonGap = -1;
            this.listContinent.treeCheckBoxClassName = "";
            this.listContinent.treeList = false;
            this.listContinent.visible = true;
            this.listContinent.wrapping = "normal";
            try
            {
                this.listContinent["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_listCountry_Scene1_Layer2_0()
        {
            try
            {
                this.listCountry["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listCountry.enabled = true;
            this.listCountry.focusable = false;
            this.listCountry.itemRendererName = "ListItemRenderer_h20";
            this.listCountry.itemRendererInstanceName = "";
            this.listCountry.margin = 0;
            this.listCountry.multiSelect = false;
            this.listCountry.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listCountry.rowHeight = 0;
            this.listCountry.scrollBar = "DefaultScrollBar";
            this.listCountry.treeButtonClassName = "";
            this.listCountry.treeButtonGap = -1;
            this.listCountry.treeCheckBoxClassName = "";
            this.listCountry.treeList = false;
            this.listCountry.visible = true;
            this.listCountry.wrapping = "normal";
            try
            {
                this.listCountry["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_Scene1_Layer2_0()
        {
            try
            {
                this.btnOK["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnOK.autoRepeat = false;
            this.btnOK.autoSize = "none";
            this.btnOK.enabled = true;
            this.btnOK.focusable = false;
            this.btnOK.groupName = "";
            this.btnOK.label = "";
            this.btnOK.overlayAlign = "none";
            this.btnOK.overlayImg = "";
            this.btnOK.overlayPadding = {x:0, y:0};
            this.btnOK.preventAutoSize = true;
            this.btnOK.selected = false;
            this.btnOK.toggle = false;
            this.btnOK.visible = true;
            try
            {
                this.btnOK["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnCancel_Scene1_Layer2_0()
        {
            try
            {
                this.btnCancel["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnCancel.autoRepeat = false;
            this.btnCancel.autoSize = "none";
            this.btnCancel.enabled = true;
            this.btnCancel.focusable = false;
            this.btnCancel.groupName = "";
            this.btnCancel.label = "";
            this.btnCancel.overlayAlign = "none";
            this.btnCancel.overlayImg = "";
            this.btnCancel.overlayPadding = {x:0, y:0};
            this.btnCancel.preventAutoSize = true;
            this.btnCancel.selected = false;
            this.btnCancel.toggle = false;
            this.btnCancel.visible = true;
            try
            {
                this.btnCancel["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelContinent_Scene1_Layer2_0()
        {
            try
            {
                this.labelContinent["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelContinent.autoSize = "left";
            this.labelContinent.enabled = true;
            this.labelContinent.text = "";
            this.labelContinent.visible = true;
            try
            {
                this.labelContinent["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCountry_Scene1_Layer2_0()
        {
            try
            {
                this.labelCountry["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCountry.autoSize = "left";
            this.labelCountry.enabled = true;
            this.labelCountry.text = "";
            this.labelCountry.visible = true;
            try
            {
                this.labelCountry["componentInspectorSetting"] = false;
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
