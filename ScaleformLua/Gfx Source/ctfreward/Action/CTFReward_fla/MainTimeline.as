package CTFReward_fla
{
    import flash.display.*;
    import scaleform.clik.controls.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var Info:MovieClip;
        public var buttonBar:ButtonBar;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            this.__setProp_buttonBar_Scene1_TabBar_0();
            return;
        }// end function

        function __setProp_buttonBar_Scene1_TabBar_0()
        {
            try
            {
                this.buttonBar["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.buttonBar.autoSize = "none";
            this.buttonBar.buttonWidth = 150;
            this.buttonBar.direction = "horizontal";
            this.buttonBar.enabled = true;
            this.buttonBar.focusable = false;
            this.buttonBar.itemRendererName = "TabButton";
            this.buttonBar.spacing = 2;
            this.buttonBar.visible = true;
            try
            {
                this.buttonBar["componentInspectorSetting"] = false;
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
