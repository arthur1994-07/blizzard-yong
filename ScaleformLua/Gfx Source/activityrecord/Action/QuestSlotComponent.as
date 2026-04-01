package 
{
    import flash.display.*;
    import flash.geom.*;
    import ran.ui.core.*;
    import ran.ui.slot.*;
    import scaleform.clik.controls.*;

    dynamic public class QuestSlotComponent extends MMaskedListItemRenderer
    {
        public var QuestStatusIndicator:StatusIndicator;
        public var btnQuest:Button;
        public var ItemSlot:Slot;
        public var bg:MovieClip;
        public var bg2:MovieClip;

        public function QuestSlotComponent()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_btnQuest_QuestSlotComponent_btn_0();
            return;
        }// end function

        public function SetBgColor(param1:uint) : void
        {
            var _loc_2:* = this.bg.transform.colorTransform;
            _loc_2.color = param1;
            this.bg.transform.colorTransform = _loc_2;
            _loc_2 = this.bg2.transform.colorTransform;
            _loc_2.color = param1;
            this.bg2.transform.colorTransform = _loc_2;
            return;
        }// end function

        function __setProp_btnQuest_QuestSlotComponent_btn_0()
        {
            try
            {
                this.btnQuest["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.btnQuest.autoRepeat = false;
            this.btnQuest.autoSize = "none";
            this.btnQuest.enabled = true;
            this.btnQuest.focusable = false;
            this.btnQuest.groupName = "";
            this.btnQuest.label = "";
            this.btnQuest.overlayAlign = "none";
            this.btnQuest.overlayImg = "";
            this.btnQuest.overlayPadding = {x:0, y:0};
            this.btnQuest.selected = false;
            this.btnQuest.toggle = false;
            this.btnQuest.visible = true;
            try
            {
                this.btnQuest["componentInspectorSetting"] = false;
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
