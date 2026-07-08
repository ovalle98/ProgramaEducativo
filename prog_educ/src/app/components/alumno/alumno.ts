import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { EstatusModel } from '../../models/estatus.model';
import { EstatusService } from '../../services/estatus.service';
import { ProgramaModel } from '../../models/programas.model';
import { ProgramaService } from '../../services/programas.service';
import { AlumnoModel } from '../../models/alumnos.model';
import { AlumnoService } from '../../services/alumnos.service';



type filtro = {
  busqueda: string;
  estatus: number;
  programa: number;
};

@Component({
  selector: 'app-alumno',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './alumno.html',
})

export class Alumno implements OnInit{

  allEstatus: EstatusModel[] = []
  allProgramas: ProgramaModel[] = []
  alumnos: AlumnoModel[] = []
  isClean: boolean = false


  filtro: filtro = {
    busqueda: '',
    estatus: 0,
    programa: 0,
  };

  estatusActivo: number[] = [1,5,6];
  estatusBaja: number[] = [2,3,7];
  estatusEgresado: number =  4;

  constructor(
    private estatusService: EstatusService,
    private programaService: ProgramaService,
    private alumnoService: AlumnoService
  ) {}

  ngOnInit(): void {
    this.getEstatus();
    this.getProgramas();
    this.getAlumnos('');
  }

  getEstatus(): void {
    this.estatusService.getAllEstatus().subscribe(data => {
      this.allEstatus = data;
    })
  }

  getProgramas(): void {
    this.programaService.getAllProgramas().subscribe(data => {
      this.allProgramas = data;
    })
  }

  getAlumnos(nombre: string): void {
    this.alumnoService.getAllAlumno(nombre).subscribe(data => {
      this.alumnos = data;
    })
  }

  cleanFiltro(): void {
    console.log("clean")
    this.filtro = {
      busqueda: '',
      estatus: 0,
      programa: 0,
    }
    this.isClean = false
  }

  aplicarFiltros(): void {
    const nom_alumno = this.filtro.busqueda ? this.filtro.busqueda.toUpperCase() : ''



    //Aplicar filtro de solo nombre
    /*if(this.filtro.estatus === 0 && this.filtro.programa === 0) {
      this.getAlumnos(nom_alumno)
      return
    }*/

    //Aplicar de estats y programa
    if(this.filtro.estatus != 0 && this.filtro.programa != 0) {
      this.alumnoService.getAlumnoByProgEst(this.filtro.programa, this.filtro.estatus, nom_alumno)
      .subscribe(data => {
        this.alumnos = data
      })

      return
    }

    //aplicar solo filtro de estatus
    if(this.filtro.estatus != 0 && this.filtro.programa == 0) {
      this.alumnoService.getAlumnoByEstatus(this.filtro.estatus, nom_alumno)
      .subscribe(data => {
        this.alumnos = data
      })

      return
    }

    //aplicar filtro por programa
    if(this.filtro.estatus == 0 && this.filtro.programa != 0) {
      this.alumnoService.getAlumnoByPrograma(this.filtro.programa, nom_alumno)
      .subscribe(data => {
        this.alumnos = data
      })
      return
    }

    //Cuando no hay filtro y el buscador de nombre esta vacio
    if(this.filtro.busqueda) return

    this.alumnoService.getAllAlumno(nom_alumno)
    .subscribe(data => {
      this.alumnos = data
    })
  }





  toggleBtnClean(): void {
    this.isClean = true
  }

  estatusClass(estatus: number): string {
    if (this.estatusBaja.includes(estatus)) return 'bg-red-100 border border-red-300 text-red-800';
    if (this.estatusActivo.includes(estatus)) return 'bg-green-100 border border-green-300 text-green-800';
    return 'bg-blue-100 border border-blue-300 text-blue-800';
  }

}
