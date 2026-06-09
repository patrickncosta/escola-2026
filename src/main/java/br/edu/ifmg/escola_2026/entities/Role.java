package br.edu.ifmg.escola_2026.entities;

import jakarta.persistence.*;
import lombok.*;
import lombok.extern.java.Log;

import java.time.Instant;
import java.util.Objects;

@Getter
@Setter
@ToString
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@Entity

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

@Log

@Table(name = "role")
public class Role{

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String nome;

}
