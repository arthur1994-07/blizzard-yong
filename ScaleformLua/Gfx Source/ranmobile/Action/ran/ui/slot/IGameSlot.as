package ran.ui.slot
{

    public interface IGameSlot
    {

        public function IGameSlot();

        function highlight() : void;

        function unhighlight() : void;

        function updateCooldown(param1:Number) : void;

        function endCooldown() : void;

    }
}
