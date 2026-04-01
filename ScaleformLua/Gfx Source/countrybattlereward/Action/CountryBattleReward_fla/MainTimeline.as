package CountryBattleReward_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;
    import scaleform.clik.core.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var labelRank:Label;
        public var labelFlag:Label;
        public var labelName:Label;
        public var labelPoint:Label;
        public var labelAccelerator:Label;
        public var labelCount:Label;
        public var labelMyRank:Label;
        public var labelMyName:Label;
        public var labelMyPoint:Label;
        public var labelMyAccelerator:Label;
        public var labelMyCount:Label;
        public var labelTime:Label;
        public var btnExit:Button;
        public var list:ScrollingList;
        public var scrollBar:ScrollBar;
        public var item1:ListItemRenderer;
        public var item2:ListItemRenderer;
        public var item3:ListItemRenderer;
        public var item4:ListItemRenderer;
        public var item5:ListItemRenderer;
        public var item6:ListItemRenderer;
        public var item7:ListItemRenderer;
        public var item8:ListItemRenderer;
        public var item9:ListItemRenderer;
        public var item10:ListItemRenderer;
        public var mcMyCountryImg:UIComponent;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_list_Scene1_list_0();
            this.__setProp_scrollBar_Scene1_scrollbar_0();
            this.__setProp_labelRank_Scene1_layer1_0();
            this.__setProp_labelName_Scene1_layer1_0();
            this.__setProp_labelPoint_Scene1_layer1_0();
            this.__setProp_labelAccelerator_Scene1_layer1_0();
            this.__setProp_labelCount_Scene1_layer1_0();
            this.__setProp_labelMyRank_Scene1_layer1_0();
            this.__setProp_labelMyName_Scene1_layer1_0();
            this.__setProp_labelMyPoint_Scene1_layer1_0();
            this.__setProp_labelMyAccelerator_Scene1_layer1_0();
            this.__setProp_labelMyCount_Scene1_layer1_0();
            this.__setProp_btnExit_Scene1_layer1_0();
            this.__setProp_labelTime_Scene1_layer1_0();
            this.__setProp_labelFlag_Scene1_layer1_0();
            return;
        }// end function

        function __setProp_list_Scene1_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.focusable = false;
            this.list.itemRendererName = "";
            this.list.itemRendererInstanceName = "item";
            this.list.margin = 0;
            this.list.multiSelect = false;
            this.list.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.list.rowHeight = 0;
            this.list.scrollBar = "DefaultScrollBar";
            this.list.treeButtonClassName = "";
            this.list.treeButtonGap = -1;
            this.list.treeCheckBoxClassName = "";
            this.list.treeList = false;
            this.list.visible = true;
            this.list.wrapping = "normal";
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_scrollBar_Scene1_scrollbar_0()
        {
            try
            {
                this.scrollBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.scrollBar.enabled = true;
            this.scrollBar.minThumbSize = 10;
            this.scrollBar.offsetBottom = 0;
            this.scrollBar.offsetTop = 0;
            this.scrollBar.scrollTarget = "list";
            this.scrollBar.trackMode = "scrollPage";
            this.scrollBar.visible = true;
            try
            {
                this.scrollBar["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelRank_Scene1_layer1_0()
        {
            try
            {
                this.labelRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelRank.autoSize = "center";
            this.labelRank.enabled = true;
            this.labelRank.text = "";
            this.labelRank.visible = true;
            try
            {
                this.labelRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelName_Scene1_layer1_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.enabled = true;
            this.labelName.text = "";
            this.labelName.visible = true;
            try
            {
                this.labelName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelPoint_Scene1_layer1_0()
        {
            try
            {
                this.labelPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelPoint.autoSize = "center";
            this.labelPoint.enabled = true;
            this.labelPoint.text = "";
            this.labelPoint.visible = true;
            try
            {
                this.labelPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelAccelerator_Scene1_layer1_0()
        {
            try
            {
                this.labelAccelerator["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelAccelerator.autoSize = "center";
            this.labelAccelerator.enabled = true;
            this.labelAccelerator.text = "";
            this.labelAccelerator.visible = true;
            try
            {
                this.labelAccelerator["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelCount_Scene1_layer1_0()
        {
            try
            {
                this.labelCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelCount.autoSize = "center";
            this.labelCount.enabled = true;
            this.labelCount.text = "";
            this.labelCount.visible = true;
            try
            {
                this.labelCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyRank_Scene1_layer1_0()
        {
            try
            {
                this.labelMyRank["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyRank.autoSize = "center";
            this.labelMyRank.enabled = true;
            this.labelMyRank.text = "";
            this.labelMyRank.visible = true;
            try
            {
                this.labelMyRank["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyName_Scene1_layer1_0()
        {
            try
            {
                this.labelMyName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyName.autoSize = "center";
            this.labelMyName.enabled = true;
            this.labelMyName.text = "";
            this.labelMyName.visible = true;
            try
            {
                this.labelMyName["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyPoint_Scene1_layer1_0()
        {
            try
            {
                this.labelMyPoint["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyPoint.autoSize = "center";
            this.labelMyPoint.enabled = true;
            this.labelMyPoint.text = "";
            this.labelMyPoint.visible = true;
            try
            {
                this.labelMyPoint["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyAccelerator_Scene1_layer1_0()
        {
            try
            {
                this.labelMyAccelerator["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyAccelerator.autoSize = "center";
            this.labelMyAccelerator.enabled = true;
            this.labelMyAccelerator.text = "";
            this.labelMyAccelerator.visible = true;
            try
            {
                this.labelMyAccelerator["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelMyCount_Scene1_layer1_0()
        {
            try
            {
                this.labelMyCount["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelMyCount.autoSize = "center";
            this.labelMyCount.enabled = true;
            this.labelMyCount.text = "";
            this.labelMyCount.visible = true;
            try
            {
                this.labelMyCount["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnExit_Scene1_layer1_0()
        {
            try
            {
                this.btnExit["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnExit.autoRepeat = false;
            this.btnExit.autoSize = "none";
            this.btnExit.enabled = true;
            this.btnExit.focusable = false;
            this.btnExit.groupName = "";
            this.btnExit.label = "";
            this.btnExit.overlayAlign = "none";
            this.btnExit.overlayImg = "";
            this.btnExit.overlayPadding = {x:0, y:0};
            this.btnExit.preventAutoSize = true;
            this.btnExit.selected = false;
            this.btnExit.toggle = false;
            this.btnExit.visible = true;
            try
            {
                this.btnExit["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelTime_Scene1_layer1_0()
        {
            try
            {
                this.labelTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelTime.autoSize = "center";
            this.labelTime.enabled = true;
            this.labelTime.text = "";
            this.labelTime.visible = true;
            try
            {
                this.labelTime["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelFlag_Scene1_layer1_0()
        {
            try
            {
                this.labelFlag["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelFlag.autoSize = "center";
            this.labelFlag.enabled = true;
            this.labelFlag.text = "";
            this.labelFlag.visible = true;
            try
            {
                this.labelFlag["componentInspectorSetting"] = false;
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
