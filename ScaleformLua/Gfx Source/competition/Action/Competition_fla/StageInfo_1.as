package Competition_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;

    dynamic public class StageInfo_1 extends MovieClip
    {
        public var tfReward:TextField;
        public var tfMission:TextField;
        public var tfMissionInfo:TextField;
        public var map:LoadingImage;
        public var labelName:Label;
        public var labelAvailable:Label;
        public var labelNextBattle:Label;
        public var labelBettleTime:Label;
        public var labelRank:Label;
        public var labelInst:Label;
        public var labelMission:Label;
        public var labelMissionInfo:Label;
        public var labelReward:Label;
        public var listInst:ScrollingList;
        public var btnInfo:Button;
        public var btnOK:Button;
        public var btnCancel:Button;

        public function StageInfo_1()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_labelName_StageInfo_Label_0();
            this.__setProp_listInst_StageInfo_Label_0();
            this.__setProp_labelBettleTime_StageInfo_Label_0();
            this.__setProp_labelAvailable_StageInfo_Label_0();
            this.__setProp_btnInfo_StageInfo_Label_0();
            this.__setProp_btnOK_StageInfo_Label_0();
            this.__setProp_btnCancel_StageInfo_Label_0();
            return;
        }// end function

        function __setProp_labelName_StageInfo_Label_0()
        {
            try
            {
                this.labelName["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelName.autoSize = "center";
            this.labelName.autoSizeEnable = false;
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

        function __setProp_listInst_StageInfo_Label_0()
        {
            try
            {
                this.listInst["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.listInst.enabled = true;
            this.listInst.focusable = false;
            this.listInst.itemRendererName = "DefaultListItemRenderer";
            this.listInst.itemRendererInstanceName = "";
            this.listInst.margin = 0;
            this.listInst.multiSelect = false;
            this.listInst.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            this.listInst.rowHeight = 0;
            this.listInst.scrollBar = "DefaultScrollBar";
            this.listInst.treeButtonClassName = "";
            this.listInst.treeButtonGap = -1;
            this.listInst.treeCheckBoxClassName = "";
            this.listInst.treeList = false;
            this.listInst.visible = true;
            this.listInst.wrapping = "normal";
            try
            {
                this.listInst["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelBettleTime_StageInfo_Label_0()
        {
            try
            {
                this.labelBettleTime["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelBettleTime.autoSize = "right";
            this.labelBettleTime.autoSizeEnable = false;
            this.labelBettleTime.enabled = true;
            this.labelBettleTime.text = "";
            this.labelBettleTime.visible = true;
            try
            {
                this.labelBettleTime["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_labelAvailable_StageInfo_Label_0()
        {
            try
            {
                this.labelAvailable["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.labelAvailable.autoSize = "center";
            this.labelAvailable.autoSizeEnable = false;
            this.labelAvailable.enabled = true;
            this.labelAvailable.text = "";
            this.labelAvailable.visible = true;
            try
            {
                this.labelAvailable["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnInfo_StageInfo_Label_0()
        {
            try
            {
                this.btnInfo["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnInfo.autoRepeat = false;
            this.btnInfo.autoSize = "none";
            this.btnInfo.enabled = true;
            this.btnInfo.focusable = false;
            this.btnInfo.groupName = "";
            this.btnInfo.label = "";
            this.btnInfo.overlayAlign = "none";
            this.btnInfo.overlayImg = "";
            this.btnInfo.overlayPadding = {x:0, y:0};
            this.btnInfo.selected = false;
            this.btnInfo.toggle = true;
            this.btnInfo.visible = true;
            try
            {
                this.btnInfo["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_btnOK_StageInfo_Label_0()
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

        function __setProp_btnCancel_StageInfo_Label_0()
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

        function frame1()
        {
            return;
        }// end function

    }
}
