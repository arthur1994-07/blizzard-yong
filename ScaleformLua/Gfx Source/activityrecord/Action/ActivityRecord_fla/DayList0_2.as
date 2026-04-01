package ActivityRecord_fla
{
    import flash.display.*;

    dynamic public class DayList0_2 extends MovieClip
    {
        public var textField:AttendancePage_DayList;

        public function DayList0_2()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 2, this.frame3);
            this.__setProp_textField_DayList0_text_0();
            return;
        }// end function

        function __setProp_textField_DayList0_text_0()
        {
            try
            {
                this.textField["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.textField.autoSize = "none";
            this.textField.enabled = true;
            this.textField.text = "DAY 1";
            this.textField.visible = true;
            try
            {
                this.textField["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

        function frame2()
        {
            stop();
            return;
        }// end function

        function frame3()
        {
            stop();
            return;
        }// end function

    }
}
