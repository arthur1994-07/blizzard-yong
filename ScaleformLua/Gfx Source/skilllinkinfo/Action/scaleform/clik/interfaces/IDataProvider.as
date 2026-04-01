package scaleform.clik.interfaces
{
    import flash.events.*;

    public interface IDataProvider
    {

        public function IDataProvider();

        function get length() : uint;

        function requestItemAt(param1:uint, param2:Function = null) : Object;

        function requestItemRange(param1:int, param2:int, param3:Function = null) : Array;

        function indexOf(param1:Object, param2:Function = null) : int;

        function cleanUp() : void;

        function invalidate(param1:uint = 0) : void;

        function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void;

        function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void;

        function dispatchEvent(event:Event) : Boolean;

        function hasEventListener(param1:String) : Boolean;

        function willTrigger(param1:String) : Boolean;

    }
}
