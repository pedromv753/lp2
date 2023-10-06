package interfaces;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import entidades.producto;

public interface IProductoRepositorio extends JpaRepository<producto, Integer>  {
	@Query("SELECT p FROM Producto p WHERE LOWER(p.descripcion) LIKE %:descripcion%")
    List<producto> buscarPorDescripcion(@Param("descripcion") String descripcion);
}
