package com.aleinx.forohub.domain.respuesta;

import com.aleinx.forohub.domain.topico.Topico;
import com.aleinx.forohub.domain.usuario.Usuario;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Table(name = "respuesta")
@Entity(name = "Respuesta")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of= "id")
public class Respuesta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String mensaje;
    @ManyToOne(fetch = FetchType.EAGER)
    private Topico topico;
    private LocalDateTime fecha;
    @ManyToOne(fetch = FetchType.EAGER)
    private Usuario autor;
    private Boolean solucion;

}
