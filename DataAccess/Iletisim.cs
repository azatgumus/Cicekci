using System.ComponentModel.DataAnnotations;

namespace Cicekci.DataAccess
{
    public class Iletisim
    {
        public int Id { get; set; }
        [MaxLength(50), Required]
        public string Ad { get; set; }
        [MaxLength(50), Required]
        public string Email { get; set; }
        [MaxLength(100), Required]
        public string Konu { get; set; }
        [MaxLength(1000), Required]
        public string Mesaj { get; set; }
    }
}