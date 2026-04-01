package RanMobile_fla
{
    import flash.display.*;
    import flash.text.*;
    import scaleform.clik.controls.*;
    import scaleform.gfx.*;

    dynamic public class mcReward_Reward_2 extends MovieClip
    {
        public var tfItemCountStatic:TextField;
        public var tfItemCount:TextField;
        public var list:MaskedList_Reward;
        public var tfInfo:TextField;
        public var btnRefresh:Button;

        public function mcReward_Reward_2()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnRefresh_mcReward_Reward_asset_0();
            this.__setProp_list_mcReward_Reward_list_0();
            return;
        }// end function

        function __setProp_btnRefresh_mcReward_Reward_asset_0()
        {
            try
            {
                this.btnRefresh["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnRefresh.autoRepeat = false;
            this.btnRefresh.autoSize = "none";
            this.btnRefresh.enabled = true;
            this.btnRefresh.focusable = false;
            this.btnRefresh.groupName = "";
            this.btnRefresh.label = "";
            this.btnRefresh.overlayAlign = "none";
            this.btnRefresh.overlayImg = "";
            this.btnRefresh.overlayPadding = {x:0, y:0};
            this.btnRefresh.selected = false;
            this.btnRefresh.toggle = false;
            this.btnRefresh.visible = true;
            try
            {
                this.btnRefresh["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function __setProp_list_mcReward_Reward_list_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "MaskedListItemRenderer_MobileReward";
            this.list.itemRendererOffset = {x:0, y:0};
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 10;
            this.list.visible = true;
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            TextFieldEx.setVerticalAlign(this.tfInfo, TextFieldEx.VAUTOSIZE_CENTER);
            TextFieldEx.setVerticalAlign(this.tfItemCountStatic, TextFieldEx.VAUTOSIZE_CENTER);
            return;
        }// end function

    }
}
